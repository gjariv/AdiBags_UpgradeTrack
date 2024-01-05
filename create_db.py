import csv

import jinja2
import requests

def pull_csv(url):
    r = requests.get(url)
    return csv.DictReader((s.decode() for s in r.content.splitlines()),
                             quotechar='"',
                             delimiter=',',
                             quoting=csv.QUOTE_ALL,
                             skipinitialspace=True,
                             )

def print_csv(seasv):
    for r in seasv:
        print(r)

def get_seasons():
    seasons = pull_csv("https://wago.tools/db2/DisplaySeason/csv")
    return seasons

def get_bonus_seasons():
    bonus_seasons = pull_csv("https://wago.tools/db2/ItemBonusSeason/csv")
    return bonus_seasons

def get_upgrade_tracks():
    tracks = pull_csv("https://wago.tools/db2/ItemBonusSeasonBonusListGroup/csv")
    return tracks

def get_bonus_ids():
    ids = pull_csv("https://wago.tools/db2/ItemBonusListGroupEntry/csv")
    return ids

def format_for_addon(track_ids):
    line = 'trackIDs["{}"] = L["{}"],\n'
    blob = ''
    for track, bonuses in track_ids.items():
        for bonus in bonuses:
            blob += line.format(bonus, track)
    return blob

def render_template(track_ids):
    template = None
    with open('Database.template', 'r') as f:
        template = jinja2.Template(f.read())
    with open('Database.lua', 'w') as f:
        f.write(template.render(track_ids=track_ids))


if __name__ == '__main__':
    latest_season = sorted(get_seasons(), key=lambda x: int(x['ID']))[-1]
    bonus_seasons = get_bonus_seasons()
    latest_bonus = next(_ for _ in bonus_seasons if _['SeasonID'] == latest_season['ID'])
    upgrade_tracks = get_upgrade_tracks()
    latest_tracks = [_ for _ in upgrade_tracks if _['ItemBonusSeasonID'] == latest_bonus['ID']]
    latest_track_ids = [_['ItemBonusListGroupID'] for _ in latest_tracks]
    bonus_ids = get_bonus_ids()
    latest_bonus_ids = [_ for _ in bonus_ids if _['ItemBonusListGroupID'] in latest_track_ids]

    upgrade_track_ids = {}
    for track in latest_tracks:
        upgrade_track_ids[track['Field_10_1_0_48898_002']] = [_['ItemBonusListID'] for _ in latest_bonus_ids if _['ItemBonusListGroupID'] == track['ItemBonusListGroupID']]

    render_template(upgrade_track_ids)

    # blob = format_for_addon(upgrade_track_ids)
    # print(blob)
