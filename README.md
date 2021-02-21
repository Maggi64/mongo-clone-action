# mongo-clone-action

A simple github action to trigger mongoDB database clones via mongodump & mongorestore  
It will **overwrite** any existing target database with the source database.

## Example
Trigger manually when needed with [workflow_trigger](https://github.blog/changelog/2020-07-06-github-actions-manual-triggers-with-workflow_dispatch/)

*.github/workflows/clone-db.yaml*
```
on: [workflow_trigger]
jobs:
  mongo-clone-action:
    runs-on: ubuntu-latest
    name: Clone MongoDB
    steps:
    - uses: Maggi64/mongo-clone-action@main
      with:
        connection-uri-source: mongodb+srv://<DB_USER>:<DB_PASSWORD>@<DB_HOST>/<SOURCE_DB_NAME>
        connection-uri-target: mongodb+srv://<DB_USER>:<DB_PASSWORD>@<DB_HOST>/<TARGET_DB_NAME>
```
**It is highly recommended storing the database user and password via github secrets.**

``` 
  connection-uri-source: ${{ secrets.DB_CONNECT_URI }}/<SOURCE_DB_NAME>
  connection-uri-target: ${{ secrets.DB_CONNECT_URI }}/<TARGET_DB_NAME>
```

## Adjust action trigger
https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#on

# Contributing
I created this for my own use only. PRs extending the functionality are welcome and will be reviewed.