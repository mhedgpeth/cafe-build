include_recipe 'apt'
package 'curl'
package 'linux-image-extra-4.4.0-51-generic'
package 'linux-image-extra-virtual'
package 'apt-transport-https'
package 'ca-certificates'

apt_repository 'deb' do
  uri          'https://apt.dockerproject.org/repo/'
  arch         'amd64'
  distribution 'ubuntu-xenial'
  components   ['main']
  key          'https://yum.dockerproject.org/gpg'
end

package 'docker-engine'

directory '/var/jenkins_home' do
  owner 'root'
  group 'root'
  mode '1777'
  action :create
end

docker_image 'jenkins' do
  action :pull
end

docker_container 'jenkins' do
  repo 'jenkins'
  port ['8080:8080', '50000:50000']
  volumes ['/var/jenkins_home:/var/jenkins_home']
  action :run_if_missing
end
