*** AWS Parallel Cluster ***

* Configuring the AWS Parallel Cluster:

A custom Bootstrap script ``` pcasino_install.sh ``` is used for installing the dependencies.

``` sh
pcluster configure
```

Running the above command will create a ```config``` file in ~/.parallelcluster directory.

Shell commands used to create, stop and delete the parallel-cluster
``` sh
pcluster create -c /Users/paladugs/.parallelcluster/config pcasino-cluster
pcluster stop -c /Users/paladugs/.parallelcluster/config pcasino-cluster
pcluster delete -c /Users/paladugs/.parallelcluster/config pcasino-cluster
```
Now use ssh to login to the master instance. 
