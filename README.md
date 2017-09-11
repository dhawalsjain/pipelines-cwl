# pipelines-cwl
* This is a collection of pipelines built by 4DN-DCIC that were created and run either on the SevenBridges platform or on the 4DN platform, AWSEM.
* The repo contains a benchmarking script for some of the CWLs, that returns total space, mem and CPUs required per given input size and a recommended AWS EC2 instance type.


### Example usage of benchmarking script
* importing the module
```python
from Benchmark import Benchmark as B
```

* md5
```python
app_name = 'md5'
input_json = {'input_size_in_bytes': {'input_file': 20000}}
B.benchmark(app_name, input_json)
```
```
{'aws': {'recommended_instance_type': 't2.xlarge', 'EBS_optimized': False, 'cost_in_usd': 0.188, 'EBS_optimization_surcharge': None, 'mem_in_gb': 16.0, 'cpu': 4}, 'total_size_in_GB': 14.855186462402344, 'total_mem_in_MB': 13142.84375, 'min_CPU': 4}
```

* fastqc-0-11-4-1
```python
app_name = 'fastqc-0-11-4-1'
input_json = {'input_size_in_bytes': {'input_fastq':20000},
              'threads': 2}
B.benchmark(app_name, input_json)
```
```
{'recommended_instance_type': 't2.nano', 'EBS_optimized': False, 'cost_in_usd': 0.006, 'EBS_optimization_surcharge': None, 'mem_in_gb': 0.5, 'cpu': 1}
```

* bwa-mem
```python
app_name = 'bwa-mem'
input_json = {'input_size_in_bytes': {'fastq1':93520,
                                      'fastq2':97604,
                                      'bwa_index':3364568},
              'nThreads': 4}
B.benchmark(app_name, input_json)
```
```
{'recommended_instance_type': 'c4.8xlarge', 'EBS_optimized': True, 'cost_in_usd': 1.591, 'EBS_optimization_surcharge': 0.0, 'mem_in_gb': 60.0, 'cpu': 36}
```

To use Benchmark in from other places, install it as below.
```
pip install git+git://github.com/4dn-dcic/pipelines-cwl.git
```


### Notes on SBG/AWSEM

#### Freeze >=0.0.2
* Directory `cwl_awsem` is manually updated starting from freeze 0.0.2 (after Sep 1, 2017), since we no longer use SevenBridges.

#### Freeze `0.0.1` 
* Freeze `0.0.1` contains exported SBG CWLs and AWSEM CWL files auto-converted from SBG CWLs. The following is a description of how freeze 0.0.1 was generated.

    The content has been generated by the following command.
    ```
    source download.sh 
    ```
    For this to work, you need to have SBG_TOKEN as an environmental variable on your machine.



    To convert sbg cwl to awsem cwl in a batch, do the following
    ```
    source convert.sh
    ```
    This conversion uses script `convert_sbgcwl_to_awsemcwl.py` individually.
    The shell script assumes Mac (`xargs -I{}` instead of `xargs -i`).


