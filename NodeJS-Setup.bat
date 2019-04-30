@REM ######################## Setup Environment Variables ###################
@REM # SET Env Variables 
@REM SETX VSCODE_HOME "C:\Programs\Microsoft VS Code"
@REM SETX GIT_HOME C:\Programs\Git\cmd
@REM SETX NGINX_HOME C:\Programs\nginx-1.14.2
@REM SETX JAVA_HOME "C:\Program Files\Java\jdk1.8.0_144"

SETX PHANTOMJS_PATH "C:\Programs\node-tools\phantomjs"
SETX PHANTOMJS_BIN "%%PHANTOMJS_PATH%%\phantomjs.exe"

SETX SASS_BINARY_NODE10 "C:\Programs\node-tools\node-sass\v4.11.0\win32-x64-64_binding.node"
SETX SASS_BINARY_NODE6 "C:\Programs\node-tools\node-sass\v4.11.0\win32-x64-48_binding.node"
@REM SETX SASS_BINARY_NODE8 "C:\Programs\node-tools\node-sass\v4.11.0\win32-x64-57_binding.node"
SETX SASS_BINARY_PATH "%%SASS_BINARY_NODE10%%" 

@REM Download and extract 6.9.4 from https://nodejs.org/dist/v6.9.4/
SETX NODEJS_6 C:\Programs\node-v6.9.4
@REM Download the latest 10.15.x from https://nodejs.org/dist/latest-v10.x/
SETX NODEJS_10 C:\Programs\node-v10.15.3
@REM # Default Node
SETX NODEJS "%%NODEJS_6%%" 

@REM # ## ADD %NODEJS% to the PATH manually to not translate the variable
@REM # SETX PATH %DEV_PATH%;%GIT_HOME%;%JAVA_HOME%\bin;%USERPROFILE%\AppData\Local\Microsoft\WindowsApps;"


@REM ######################## Setup NodeJS ###################
@REM # Set NPM Configuration for Each Node Version

@REM ### Install NodeJS 6 ############################## 
cd %NODEJS_6%
SETX NODEJS "%%NODEJS_6%%" 
SETX PATH %%NODEJS%%;%%PATH%%
call %NODEJS_6%\npm -v
call %NODEJS_6%\npm config -g set prefix %NODEJS_6%
call %NODEJS_6%\npm config set prefix %NODEJS_6%
call %NODEJS_6%\npm config --global set registry http://repo.sys.cigna.com/artifactory/api/npm/npm-repos
call %NODEJS_6%\npm config --global set strict-ssl false  
@REM # Upgrade
call %NODEJS_6%\npm install -g npm@^5.0.0
@REM # Tools 
call %NODEJS_6%\npm install -g grunt-cli npm-check-updates 

@REM ### Install NodeJS 10 ############################## 
cd %NODEJS_10%
SETX NODEJS "%%NODEJS_10%%" 
call %NODEJS_10%\npm -v
call %NODEJS_10%\npm config set prefix %NODEJS_10%
call %NODEJS_10%\npm config -g set prefix %NODEJS_10%
call %NODEJS_10%\npm config --global set registry http://repo.sys.cigna.com/artifactory/api/npm/npm-repos
call %NODEJS_10%\npm config --global set strict-ssl false  
@REM # Upgrade
call %NODEJS_10%\npm install -g npm@^6.0.0
@REM # Global Tools 
call %NODEJS_10%\npm install -g grunt-cli npm-check-updates 

@REM ######################## Switch Between NodeJS ###################
@REM #### Extract to external batch files ##############################
@REM ### NodeJS 6 Switch Batch - switch-node6.bat ###
@REM ### NodeJS 10 Switch Batch - switch-node10.bat ###
@REM call switch-node10.bat

