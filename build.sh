echo ""
$LIFERAY_TOMCAT/bin/shutdown.sh
sleep 30

cd "$LIFERAY_TOMCAT/webapps/"
#remove all stud- portlets from webapps
for folder in $(find . -mindepth 1 -maxdepth 1 -type d -name 'stud-*' -printf "%P\n") ; do
    echo rm -r $folder; 
done

#clean liferay`s deploy directory and assign path to this directory to "directory_to_deploy" variable
cd $LIFERAY_TOMCAT
cd ../deploy

echo $(pwd)
directory_to_deploy=$(pwd)

for smth in $(find . -mindepth 1 -maxdepth 1 -name '*.war' -printf "%P\n") ; do
    rm $smth;
done
#$BUILD_ID = 'dontKillMe'
$LIFERAY_TOMCAT/bin/startup.sh
sleep 90
cd $WORKSPACE
#copy all war files to liferay`s deploy directory
for folder in $(find . -mindepth 1 -maxdepth 1 -type d -name '*Portlet' -printf "%P\n") ; do
    cp $folder/target/*.war $directory_to_deploy ; 
    sleep 60;
done
