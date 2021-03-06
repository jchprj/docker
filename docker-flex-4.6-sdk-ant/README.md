Compile Adobe Flash SWF using Adobe Flex SDK 4.6 and ant
(Ant support ECJ compiler: org.eclipse.jdt.core.JDTCompilerAdapter)


Example usage:
```
docker run -v ${PWD}:/usr/src --rm jchprj/docker-flex-4.6-sdk-ant ant -f build.xml
```

Compile a single file:
```
docker run -v ${PWD}:/flash -it --rm jchprj/docker-flex-4.6-sdk-ant mxmlc /flash/HelloWorld.as
```
