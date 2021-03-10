# README
Our project is making a database and related website that contains resources for children with mental disorders. There’s a lack of easily accessible information about the mental health resources in Iowa, which makes it difficult for parents and for doctors to help mentally ill children. Iowa needs a database to help people find resources for their children/patients, but it is time-consuming and unrealistic to update health-provider information manually. We intend to make a database that is self-sustaining. People with mental disorders have so many challenges trying to operate in our world, and any sort of help and connection to resources would help immensely. The group we are partnering with is National Alliance on Mental Illness, or NAMI.

## Ruby version
ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-linux]

## Gems
- [pg_search](https://github.com/Casecommons/pg_search): used for advanced database search
- [Devise](https://github.com/plataformatec/devise): used for user authentication and user actions
- [Mocha](https://github.com/freerange/mocha): used for testing

## Configuration
[Gemfile for this project](nami_website/Gemfile)

## Database
We used PostgreSQL because we waant to store arrays in the database. 

To enter the PSQL console, type
```bash
psql
```
To quit the PSQL console, type
```bash
\q
```

To enter the rails database console in order to view the data, type
 ```bash
 rails console
 ```
To quit the console, type
```bash
quit
```

Note: if you want to play with the database without making any accidental changes to the real database, you can type
```bash
rails console --sandbox
```
This will bring you to a "sandbox" and any changes you make in the sandbox will be rolled back once you quit.

## How to run the test suite
```rails
sprint rspec
```
or, to specify the test of a specific section, you can type:
```rails
rspec spec/requests
```

## Deployment instructions
IMPORTANT NOTE: due to limitations on free Heroku accounts, this app is no longer deployed.  If you want to deploy the app, you will need to create a new Heroku account and link to heroku.

The project WAS deployed to Heroku on https://dashboard.heroku.com/apps/frozen-hollows-51585. It should be connected already to the cloud9 repository. You can view our currently app at https://frozen-hollows-51585.herokuapp.com/ 

To deploy to the connected Heroku dashboard, type
```git
git push heroku
```
For the next group, you might want to deploy it to a completely different heroku if that’s easier. Note: the current deployment is behind this repo!!
