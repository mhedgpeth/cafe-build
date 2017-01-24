cookbook 'docker'

docker_service 'jenkins' do
  action [:create, :start]
end

docker_image 'jenkins' do
  action :pull
end

docker_container 'jenkins' do
  repo 'jenkins'
  port ['8080:8080', '50000:50000']
  volumes ['/your/home:/var/jenkins_home jenkins']
end
