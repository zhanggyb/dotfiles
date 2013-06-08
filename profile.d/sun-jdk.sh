# set Sun Java SDK

if [ -d /opt/java ]
then
	JAVA_HOME=/opt/java
	PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH

	export JAVA_HOME
	export PATH
fi
