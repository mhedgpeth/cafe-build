
# install windows container feature
cookbook 'chocolatey'

chocolatey 'dotnetcore'
chocolatey 'cake.portable'

windows_feature 'containers' do
  action :install
end
