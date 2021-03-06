ExUnit.start()
Elasticsearch.Test.Repo.start_link()

unless System.get_env("CI") do
  Elasticsearch.Executable.start_link(
    "Elasticsearch",
    "./vendor/elasticsearch/bin/elasticsearch",
    9200
  )
end

{:ok, _} = Elasticsearch.Test.Cluster.start_link()
{:ok, _} = Elasticsearch.wait_for_boot(Elasticsearch.Test.Cluster, 15)
