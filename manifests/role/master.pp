# = Class site_hadoop::role::master
#
# Hadoop Master server in cluster without high availability.
#
class site_hadoop::role::master {
  include ::site_hadoop::role::master_hdfs
  include ::site_hadoop::role::master_yarn

  if $hadoop::hdfs_deployed {
    if $site_hadoop::spark_enable {
      Class['hadoop::namenode::service'] -> Class['spark::historyserver::service']
    }
  }
}
