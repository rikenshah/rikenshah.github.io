---
layout: post
title: System Design
excerpt: Cracking the system design questions in the interview
categories: articles
tags: [system_design, interview]
author: riken_shah
comments: true
share: true
modified: 2018-05-05T14:18:57-04:00
published: true
---

Consider following things.

1. Ask Good Questions 
    - Define the minimum viable product
    - What features to care about.
        + keep it minimum, since we need to dive into this)
    - How much to scale.
        + Requests per second, database size
2. Don't use Buzzwords
    - Whatever you know, stick to that
    - Don't use any words that you don't know, it might backfire
3. Clean and organized thinking
    - Draw boxes, attributes, gave more clarity on an overall structure
4. Drive discussions (80-20)
    - An interviewer should only talk 20% time
5. Use your personal experience
6. Practice - Brainstorm with peers
7. Gain knowledge, read blogs, new technologies

### Basic Elements

1. Features
    - Define MVP
    - For eg - Facebook messenger, then you can include one-to-one but maybe leave the group chat
2. Define APIs
    - For your system to intake as well as output
3. Availability
    - How much risk can be tolerated?
4. Latency Performance
    - Background processing may not be very performance intensive, but a customer-facing application, then we might need it to be very fast.
    - Based on this factors, features like `caching` might be necessary.
5. Scalability
    - Will it work for 100 users? 1000? 100000?
    - How will it affect the other factors
6. Durability
    - Sometimes it is required
    - Data is not compromised
    - Most of the times, it is handled by the database used
7. Class Diagram
    - Cases like elevator system and parking lot, this would be helpful
8. Security & Privacy
    - Design authentication system - Here this will be the central factor
9. Cost Effectiveness
    - Will there be an alternate less costly solution?

### Concepts to know about

- Vertical vs horizontal scaling
    + Vertical - Add more memory/CPU to the same hosts
    + Horizontal - Add more hosts (Distributed Systems)
- CAP theorem
    + Consistency, Availability, Partition Tolerance
    + Any two
    + Traditional RDBMS choose consistency over availability
    + NoSQL prefers availability over consistency (provided that it is configured so)
- ACID vs BASE
    + Atomicity, Consistency, Isolation and Durability
        * Mostly used for RDBMS
    + Basically available, soft state eventual consistency
        * Mostly NoSql
- Partitioning/Sharding data
    + How to partition your trillion records
    + Consistent Hashing
        * This is very important sharding technique
- Optimistic vs Pessimistic Locking
    + Mainly for committing transaction in DB
- Strong vs Eventual consistency
    + Strong means reads will see all latest writes
    + Eventual consistency enables high availability
- Relational DB vs NoSQL
    + Do not discard RDBMS immediately
    + Adapt to the scenario
- Types of NoSql
    + key value
    + wide column
        * A row can have many types of columns
    + document based
        * Semistructured data
    + graph based
        * Entities and relations
- Caching
    + To speed up the requests
    + Cache most request data
    + Two types
        * Cache data shared between nodes
        * Split Cache - not shared between nodes
    + Cache cannot be the source of truth
    + Cache has to be pretty small
    + Consider eviction policies of cache
- Data center/ Racks/ Hosts
    + Be aware of current architectures
    + Understand latencies
    + Understand what is one of them goes down
- CPU, Memory, Hard Drive, Network Bandwidth
    + All are limited resources
    + Improve throughput latencies
- Random vs Sequential Read Write on Disk
    + Design systems around sequential read and writes around disks
    + Random access on disk can be pretty slow (not same for cache/memory)
- `HTTP` vs `http2` vs `WebSockets`
    + `HTTP` is request/reply
    + `http2` overcomes some limitations of `HTTP` like can have multiple requests in one connection
    + `WebSockets` can have fully bidirectional communication between client and server
- TCP/IP model
    + Layers of it and what it does
- `ipv4` vs `ipv6`
    + 32 bit vs 128-bit addresses, since we are running out
    + IP routing and how it works
- TCP/UDP
    + TCP is connection oriented, reliable (documents)
    + UDP is unreliable connection (video streaming, since UDP is fast)
- DNS Lookup
    + DNS domain name server lookups work
- HTTPS and TLS
    + TLS is transport layer security
    + When used with `HTTP` it becomes `https`
- Public key infrastructure and certificate authority
    The + Certificate authority is trusted authority which tells you that public key is valid
- Symmetric vs asymmetric keys
    + Asymmetric is computationally expensive
    + AES, DES, etc.
- Load balancer - L4 vs L7
    + Sit in front of the service and delegate the client requests to the nodes
    + Round robin
    + Average load on nodes
    + L4 and L7 are levels of OSI models
    + Most operate at L7
- CDNs and Edge
    + Content delivery network
    + For improving performance
    +, For instance, Netflix will bring video close to you when you are streaming
    + EDGE - do processing close to the user
- Bloom filters and count-min sketch
    + Space efficient probabilistic based data structures
    + It is used to decide if an element is a member of a set or not
    + It can have false positives but it will never have false negatives
    + Count min sketch is a similar data structure but it is used to count the frequencies of the events
    + Eg. A million events and you are interested in top-k, so instead of keeping the counts of all events
    + For a fraction of a space, it will give a close-enough answer with some error rate
- Paxos-consensus over distributed hosts
    + Leader selection
    + Understand the use cases
- Design patterns and object-oriented designs
    + Abstraction, Inheritance etc for OO
    + Factory methods and Singleton for Design patterns
- Virtual machines and containers
- Publish-subscribe over queues
    + Very important these days
    + Customer facing request should not be directly exposed to a pub-sub system
- MapReduce
    + Distributed parallel processing of data
    + Map is filtering and sorting the data
    + Reduce is summarizing the data
- Multi-threading, concurrency, locks, synchronization, CAS

### Implementations

- Cassandra
    + Its wide column highly scalable NoSQL DB
    + Time series data
    + can provide both eventual as well as strong consistency
    + consistent hashing to shard the data and use gossiping to inform all nodes in the cluster
- MongoDB / Couchbase
    + JSON 
    + ACID properties at document level
- MySQL
    + RDBMS
    + Master-Slave architecture and hence can scale nicely
- Memcached / Redis
    + Distributed cache and hold data in memory
    + Memcached - simple fast key-value storage
    + Redis - can be configured as a cluster
- Zookeeper
    + A Centralized configuration management tool
    + Leader selection and distributed locking
    + Scales amazingly well for reads but not for writes
    + All data in memory hence limitations
- Kafka
    + Fault tolerant, highly available queue for the pub-sub streaming application
    + can deliver a message only once and in order
- Nginx / HAProxy
    + Load balancers
    + Nginx 10k connections
- Solr, Elastic Search
    + Both are based on Lucene
    + Highly scalable, available and fault tolerant
    + Full-text search
- Blobstore like Amazon S3
    + Big pictures
- Docker 
    + Kubernetes
    + Mesos
- Hadoop/Spark
    + MapReduce 
    + HDFS - java based file system which is tolerant and distributed and Hadoop relies on it for all the processing
    + Spark is faster in MapReduce since it does processing in memory

### References

1. [System Design for Interview - Tushar Roy](https://www.youtube.com/watch?v=UzLMhqg3_Wc)