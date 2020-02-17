//Jenkinsfile for automated build generation
//set the variables under "environment" to configure this file. Further changes are not necesarry.
pipeline {
	agent none
	environment {
		//Linux Variables
		LINREPO = "/var/lib/jenkins/workspace/mbtcreator-repository-${env.BRANCH_NAME}"					//path to source directory

		//Windows Variables
		WINREPO = "F:\\Jenkins\\workspace\\mbtcreator-repository-${env.BRANCH_NAME}"					//path to source directory

		//The following variables are generated automatically and don't have to be configured:
		WINREPO_FS = "${env.WINREPO}".replaceAll( '\\\\','/')
		
	}
	stages {
		stage('Update Version') { 
			//when {
			//	expression {
			//		return env.BRANCH_NAME == 'master';
			//	}
			//}
			steps {
				node('Linux_Debian') {
					ws("${env.LINREPO}") {
						checkout scm
						script {
							sh '''
								OLD_VERSION=`cat  mbtinstaller/version`
								VERSION="$(git describe --tags $(git rev-list --tags --max-count=1))"
								CURRENT_BRANCH="$(git branch --contains | sed 's/^.* //')"
								if [ "$VERSION" != "$OLD_VERSION" ]
									then
									xmlstarlet ed --inplace -u '/Package/Version' -v ${VERSION} mbtinstaller/packages/eu.ifak.mbt/meta/package.xml
									xmlstarlet ed --inplace -u '/Package/Version' -v ${VERSION} mbtinstaller/repository_config/MBTCreator/meta/package.xml
									sed -i "s/^APP_VERSION =.*/APP_VERSION = $VERSION/" appconfig.pri
									echo ${VERSION} > mbtinstaller/version
									TODAY="$(date +"%F")"
									xmlstarlet ed --inplace -u '/Package/ReleaseDate' -v ${TODAY} mbtinstaller/packages/eu.ifak.mbt/meta/package.xml
									xmlstarlet ed --inplace -u '/Package/ReleaseDate' -v ${TODAY} mbtinstaller/repository_config/MBTCreator/meta/package.xml
									git remote set-url origin git@gitlab.ifak.eu:vua/tfvs/mbtcreator/mbtcreator.git
									git config --global user.name "jenkins"
									git config --global user.email jenkins@ifak.eu
									git add -A
									git commit -am 'Bumped version number'
									git push origin "$CURRENT_BRANCH"
									return 1
								else
									return 0
								fi
							'''
						}
					}
				}
			}
		}
		stage('Checkout') {
			steps{
				parallel 'Linux_Debian': { node('Linux_Debian') {
					ws("${env.LINREPO}") {
						checkout scm
					}
				}},
				'Win64': { node('Win10(x64)') {
					ws("${env.WINREPO_FS}") {
						checkout scm
					}
				}}
			}
        }
		stage('Start Build Jobs') {
			steps {
				parallel 'Linux_Debian': { node('Linux_Debian') {
					build job: 'mbtcreator-linux_x64', parameters: [
						string(name: 'REPOSITORY', value: "${env.LINREPO}"),
						string(name:'BRANCH_NAME', value: "${env.BRANCH_NAME}"),
						string(name:'AUTHORS', value: currentBuild.changeSets[0].collect { it.author }.unique().join(", "))]
				}},
				'Win64': { node('Win10(x64)') {
					build job: 'mbtcreator-win_x64', parameters: [
						string(name: 'REPOSITORY', value: "${env.WINREPO}"),
						string(name:'BRANCH_NAME', value: "${env.BRANCH_NAME}"),
						string(name:'AUTHORS', value: currentBuild.changeSets[0].collect { it.author }.unique().join(", "))]
				}}
			}
		}
	}
}