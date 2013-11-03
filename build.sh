for folder in $(find . -mindepth 1 -maxdepth 1 -type d -name '*Portlet' -printf "%P\n") ; do
    echo $folder; 
done

cd $LIFERAY_TOMCAT/webapps/

for folder in $(find . -mindepth 1 -maxdepth 1 -type d -name 'stud-*' -printf "%P\n") ; do
    echo $folder; 
done