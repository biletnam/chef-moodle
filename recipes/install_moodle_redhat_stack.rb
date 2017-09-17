package 'nginx' do
  action :install
end

package 'php70w-fpm' do
  action :install
end

package 'php55w-common' do
 action :remove
end

package 'php70w' do
  action :install
end

package 'php70w-pgsql' do
  action :install
end

template '/etc/nginx/conf.d/default.conf' do
  source 'default.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'nginx' do
  action [ :enable, :start ]
end

service 'php-fpm' do
  action [ :enable, :start ]
end
