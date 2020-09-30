import requests
import pandas as pd

# Scraper for coronatracker.at. Based on philshem's scrape_coronadata_at.py -
# see https://gist.github.com/philshem/388f009a839cdcecb32c40b0d8f01b6e#file-scrape_coronadata_at-py

# scraping individual states from:
# https://www.coronatracker.at/

# manually got each state's name from the site dropdown Bundesländer 
states = pd.DataFrame({
    "name": ['burgenland','kaernten','niederoesterreich','oberoesterreich',
            'salzburg','steiermark','tirol','vorarlberg','wien'],
    "threshold": ['147,22','280,65','842,14','745,14',
            '279,21','623,20','378,82','198,57','955,60']
})

headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'}
s = requests.Session()
url_base = 'https://www.coronatracker.at/'

big_df = []
# loop over all states, aka url paths
for x in range(0, len(states)):
    state = states.loc[x,'name']
    print(state)
    url = url_base + state

    # make request
    r = s.get(url, headers=headers)

    # convert html to dataframe, thanks pandas
    # add [0] because read_html() returns a list of dataframes
    df = pd.read_html(r.content)[0]

    # add state to dataframe
    df['state'] = state
    df['url'] = url

    # translate Datum value (timestamp) to isodate using regex
    df['date'] = df['Datum'].str.replace(r'^(\d{2})\.(\d{2})\.(\d{4}).*',r'\3-\2-\1')
   
    # extract case numbers and growth value from 'Fälle (Gesamt)' column
    df[['cases', 'growth']] = df['Fälle (Gesamt)'].str.replace('.', '').str.extract(r'(\d+)\s+\+?(-?\d+)')

    # calculate cumulated growth for preceding seven days
    df['growth_cumulated'] = 0
    for i in range(0, (len(df)-7)):
        gc = 0
        for j in range(1,8):
            gc = gc + int(df.loc[i+j,'growth'])
        df.loc[i, 'growth_cumulated'] = gc
    df['threshold'] = states.loc[x,'threshold']

    # extract certain columns, sort by date ascending (source is sorted descending)
    df_extract = df[['state','date','cases','growth','growth_cumulated','threshold']].sort_values(by=['date'])

    # add extracted dataframe to list of states
    big_df.append(df_extract)

# concat all dataframes
df = pd.concat(big_df)

df.to_csv('at.csv',index=False)
#print(df)
