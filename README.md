# bigboat-tools

Contains various tools for working with bigboat

# delete-app-definitions

Usages:

`docker run --rm ictu/bigboat-tools ./delete-app-definitions.sh $appName $project $apiKey $tag`

or

Make sure you have bash, curl and jq installed and run: `./delete-app-definitions.sh $appName $project $apiKey $tag`

Arguments:

* _$appName_ The name of the application definition to delete versions for. This is the name specifief in the Bigboat Compose file
* _$project_ The name of the project to delete application definitions for. Example: for `http://www.dashboard.isd.ictu/` the project name is 'isd'.
* _$apiKey_ The API key used to communicate with Bigboat. This can be the deploy-key are an API Key found under the menu 'Configuration' in Bigboat.
* _$tag_ Application definitions with this tag will be skipped. **_All_** other application definitions will be deleted.