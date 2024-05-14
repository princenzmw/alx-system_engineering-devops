# 0x19. Postmortem

## SERVER OUTAGE INCIDENT REPORT

<img src="https://t3.ftcdn.net/jpg/04/92/09/72/240_F_492097246_yagE8x9Uk8M9IekPy7GBuE0x1Uoa7esD.jpg" width="1000" height="300">

April 20th, 2024, we experienced server downtime on all my server infrastructure which resulted in my clients inability to use my services and I sincerely apologize for any loss my clients might have faced during this period.

### Issue Summary
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_iVJNbyc1zz2iICgPe8w5S3DoRkt8_5aeIg&usqp=CAU" width="1000" height="300">

On April 20th, 2024, I experienced a server downtime on all of my server infrastructure which lasted for 3 hours. As a result of this, my clients experienced a http `500 error` which had a **FULL impact** on their business as they were unable to access my services. The root cause was not properly testing out all implemented upgrades before pushing to production servers.


| Time (GMT + 2) | Actions |
| -------------- | -------- |
| 10:35 PM | Start upgrading implementation |
| 11:15AM | Server Downtime starts here |
| 12:03AM | Pagers alerted on-call team |
| 12:10AM | On-call team acknowledgement |
| 12:35AM | The Rollback initiation |
| 01:00PM | Rollback done Successfully |
| 01:20PM | Restarting the Server |
| 01:22PM | All the traffic back online |


### Root cause
<img src="https://blog.systemsengineering.com/hs-fs/hubfs/blog-files/Root%20Cause.jpg?width=600&name=Root%20Cause.jpg" height="300" width="1000">

At 9:45am (GMT + 2) server upgrade was initiated across all my production servers without first releasing my test environments and performing all necessary unit testing. Part of the upgrade been shipped to production server required an authentication from a Third party software, this new implementation is not supported on the current version present on my servers which resulted in the downtime experienced. I was able to resolve this quickly by first rollbacking the severs to previous state thereafter upgrading the current version on my servers.


### Preventive measures
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh8wOXyFPhkBS9zuXzmGOtBDGGX4Nfz9ucWg&usqp=CAU" height="300" width="1000">

- Firstly, pushing all intended changes to my test environments before shipping to life server.
- Increasing the performance metrics threshold to alert on-call engineers on the event of possible server crash

#### AUTHOR

> By  [Prince NZAMUWE](https://github.com/princenzmw)
> <princenzmw@gmail.com>
