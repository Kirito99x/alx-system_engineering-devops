# web infarstrcutuer project 
### task 0 answers and explaintion:
1. What is a server; A server is a device, a virtual device or computer program or providing
functionality for other programs or devices, called “clients”.
2. What is the role of a domain name; A domain name serves to identify Internet
resources, such as computers, networks, and services with a text-based label that is
easier to memorize than numerical addresses (IP addresses).
3. What type of DNS record www is in www.foobar.com; It is a ‘cname’.
4. What is the role of the Web Server; The role of a Web Server is to store, process and
display website contents (codebase); deliver web pages to users (basically HTML and
CSS) over the protocol HTTP.
5. What is the role of the application server; The role of the application server is to
generate dynamic contents by executing server-side code such as JSP, Ajax,
PHP, etc.
6. What is the role of the database; The role of a database is to manage data
systematically and efficiently in a well-organized manner which allows data to be easily
added, accessed, updated, managed, and deleted.
7. What is the server using to communicate with the computer of the user requesting
the website; The server communicates through HTTP protocol.

### issues with infrastructrue:

1. Single Point Of Failure (SPOF): Numerous single points of failure exist, starting with the presence of a sole server incorporating only one web server, application server, and database. In the event of a failure in any of these components, the entire system ceases to function.

2. Downtime during maintenance requirements (such as deploying new code where the web server needs restarting): The downtime duration might extend beyond expectations because the server relies on a single code base, which, at that particular moment, is inaccessible. Consequently, users are unable to access the website and its content, resulting in a negative user experience and a loss of traffic.

3. Limited scalability under high incoming traffic: The domain name directly points to the server and lacks a load balancer, making it challenging to handle increased loads efficiently. This poses a challenge in accommodating a higher volume of users attempting to access the website's content, potentially leading to a suboptimal user experience or imposing a limit on the number of users the website can support.

### task 1 answers and explaintion:
The rationale behind adding each additional element is to enhance system resilience and performance. Introducing a new server allows for the incorporation of a load balancer, facilitating the management of high incoming traffic and mitigating the risks associated with a single point of failure that may arise when relying on a single server.

Our load balancer operates using the Round Robin algorithm, which systematically connects to servers in sequence, serving requests in a sequential manner. This algorithm is suitable for servers with equal specifications and where persistent connections are not a predominant factor. After directing a request to the last server, the sequence restarts from the first server.

The load balancer is configured for an Active-Active setup, wherein both nodes (servers) actively run the same service simultaneously. This contrasts with an Active-Passive setup where not all nodes are concurrently active; in a two-node scenario, if the first node is active, the second remains passive or on standby. The key distinction lies in performance, as Active-Active clusters utilize the resources of all servers during regular operation, whereas in Active-Passive clusters, the backup server only engages during failover.

In a Primary-Replica (Master-Slave) database cluster, master-slave replication ensures data from the primary server (master) is duplicated to one or more secondary servers (slaves). The master logs updates, and these changes propagate to the slaves. Synchronous replication occurs when changes are made simultaneously, while asynchronous replication involves queued updates written later. This setup is commonly employed to distribute read access for scalability, with additional uses such as failover or offloading analytical tasks to the slave to prevent overburdening the master.

The distinction between the Primary node and Replica node in an application context lies in redundancy and capacity. The Replica node serves as a redundant copy of the Primary node, offering protection against hardware failures and augmenting capacity to handle read requests, such as document searches or retrievals.
### issues with infrastructrue:
1. Single Point Of Failure (SPOF): The primary vulnerability in this infrastructure is centered around a singular load balancer, representing a significant single point of failure. Relying on only one load balancer poses a risk to the overall system's reliability and availability.

2. Security Concerns (absence of firewall, lack of HTTPS): Notable security concerns arise from the application's reliance on the unsecured HTTP protocol, potentially exposing sensitive information to attackers since HTTP transfers data in plain text, including passwords. Additionally, the absence of a firewall leaves the system susceptible to various security threats. This vulnerability could lead to denial-of-service (DOS or DDOS) attacks causing significant downtime or allow malicious attackers to exploit unknown open ports for unauthorized access and data exfiltration.

3. Lack of Monitoring: The absence of monitoring is a notable deficiency in this system. Adhering to the tech industry's wisdom that "you cannot fix or improve what you cannot measure," implementing comprehensive monitoring for the server, website, or application is crucial. Monitoring enables prompt identification and resolution of problems, downtime, or security threats before they escalate. It not only enhances productivity but also has the potential to reduce IT support costs, ultimately contributing to an improved overall user experience.

### task 2 answers and explaintion:
1-The addition of three new components serves specific purposes in enhancing system security and performance. Each server now incorporates a dedicated firewall to fortify defenses against potential attacks and exploits. Additionally, an SSL certificate has been implemented for www.foobar.com to enable secure data transmission over HTTPS. Furthermore, three monitoring clients have been introduced to collect logs systematically and transmit them to the data collector, Sumologic.

2-Firewalls serve as a network security system designed to monitor and regulate incoming and outgoing network traffic based on predefined security rules. Their primary function is to establish a protective barrier between a trusted network and an untrusted network, thereby safeguarding the overall network infrastructure.

3-The decision to serve traffic over HTTPS is rooted in security considerations. While traffic was previously transmitted over the unsecured Hypertext Transfer Protocol (HTTP), the adoption of HTTPS ensures data encryption through Transport Layer Security (TLS), providing a more secure communication channel compared to the plaintext nature of HTTP.

4-Monitoring is employed to proactively detect and diagnose any performance issues related to web applications, enabling timely intervention and optimization.

5-The monitoring tool collects data by capturing logs from various sources, including the application server, MySQL Database, and Nginx web server. In a computing context, a log refers to automatically generated and timestamped documentation of events relevant to a specific system.

6-To monitor web server Query Per Second (QPS), a strategy involves recognizing that one web server can effectively handle 1,000 queries. This understanding forms the basis for establishing appropriate monitoring practices to ensure optimal performance and responsiveness.

### issues with infrastructrue:
1. The challenge with terminating SSL at the load balancer level lies in the resource-intensive nature of decryption. While offloading decryption to the load balancer allows the server to allocate processing power to application tasks, the specific issue is not entirely clear at the moment (to be further addressed in an update).

2. The issue with having only one MySQL server capable of accepting writes is significant because if it goes down, the system cannot add or update data. This, in turn, disrupts the functionality of certain features within the application.

3. The potential problem with employing servers with identical components (database, web server, and application server) arises from the risk of a bug affecting one component in one server also being present in the other servers. In such a scenario, the bug would be replicated across multiple servers, potentially leading to widespread issues.

### task 3 answers and explaintion:
The addition of each new element serves a specific purpose in system enhancement. Introducing one extra server has enabled the segregation of each component (Nginx for the web server, the code base for the application server, and MySQL for the database) onto dedicated servers. This configuration ensures redundancy, with the additional server acting as a backup in case of component or server failure. Each server is under active monitoring and fortified with a firewall. Furthermore, an extra load balancer has been incorporated to efficiently manage increased traffic across the entire infrastructure.

# Authors
mohamed saieldin
mohamed siralkhtim (moealsir)
