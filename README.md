docker local test

# build.cmd

Windows only, it is designed for use with VS Code task

## Parameters

build.cmd \<relative path dockerfile\> \<build tag\>

If *build tag* is ommited, build using filename as tag

## Examples

`build.cmd test-alpine\alias.Dockerfile`  
Equals to:  
`docker build -t test-alpine:alias -f test-alpine/alias.Dockerfile test-alpine`

`build.cmd test-alpine\alias.Dockerfile latest`  
Equals to:  
`docker build -t test-alpine:latest -f test-alpine/alias.Dockerfile test-alpine`

## VS Code task configuration

```
{
	"label": "build image with tag",
	"type": "shell",
	"command": "cmd",
	"args": [
		"/C",
		"${workspaceFolder}/build.cmd",
		"${relativeFile}"
	],
	"problemMatcher": []
}
```

# build.sh 

Not available yet