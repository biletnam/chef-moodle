include_recipe "moodle::install_moodle_redhat_stack"
include_recipe "moodle::install_moodle"

include_recipe "postgresql::server"
include_recipe "database::postgresql"

conn_info = {
  :host => "localhost",
  :username => "postgres",
  :password => node['postgresql']['password']['postgres']
}

postgresql_database_user "moodleuser" do
  connection conn_info
  'password'
  action :create
end

postgresql_database "moodle" do
  connection conn_info
  action :create
end

postgresql_database_user "moodleuser" do
  connection conn_info
  database_name "moodle"
  privileges [:all]
  action :grant
end
