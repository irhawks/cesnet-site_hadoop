# = Class site_hadoop::role::slave
#
# Hadoop worker node.
#
class site_hadoop::role::slave {
  include ::hadoop
  include ::site_hadoop::role::common

  if $hadoop::zookeeper_deployed {
    include ::hadoop::datanode
    if $site_hadoop::yarn_enable {
      include ::hadoop::nodemanager
    }

    if $hadoop::hdfs_deployed {
      if $site_hadoop::hbase_enable {
        include ::hbase::regionserver
      }

      if $site_hadoop::impala_enable {
        include ::impala::server
        include ::hadoop::common::hdfs::config

        Class['::hadoop::common::hdfs::config'] -> Class['::impala::common::config']
        if $site_hadoop::hbase_enable {
          include ::hbase::common::config
          Class['::hbase::common::config'] -> Class['::impala::common::config']
        }
      }
    }
  }

  if $site_hadoop::hive_enable {
    include ::hive::worker
  }

  if $site_hadoop::spark_standalone_enable {
    include ::spark::worker
  }
}
