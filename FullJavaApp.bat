@echo off
Set /p Proyecto= Nombre del proyecto 
SET Drive = "J:"

cmd /c md %Drive%\JavaProjects\%Proyecto%\.vscode
cmd /c copy C:\MyJava\Java.gitignore %Drive%\JavaProjects\%Proyecto%\.gitignore
cmd /c copy C:\MyJava\JavaLaunch.txt %Drive%\JavaProjects\%Proyecto%\.vscode\launch.json

cmd /c cscript C:\MyJava\pom.vbs %Drive%\JavaProjects\%Proyecto%\.vscode\launch.json "Proyecto" %Proyecto%

cmd /c cd %Drive%\JavaProjects
cmd /c mvn archetype:generate -DgroupId=Aplicacion -DartifactId=%Proyecto% -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false

cmd /c cscript C:\MyJava\pom.vbs %Drive%\JavaProjects\%Proyecto%\pom.xml "<maven.compiler.source>1.7</maven.compiler.source>" "<maven.compiler.release>16</maven.compiler.release>"
cmd /c cscript C:\MyJava\pom.vbs %Drive%\JavaProjects\%Proyecto%\pom.xml "<maven.compiler.target>1.7</maven.compiler.target>" ""

cmd /c git init %Drive%\JavaProjects\%Proyecto%\

code  %Drive%\JavaProjects\%Proyecto%\
exit