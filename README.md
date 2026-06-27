# FreeRadius for Mikrotik Container

This project provides build and configuration information to run [FreeRadius](https://www.freeradius.org/) in [Mikrotik Container](https://help.mikrotik.com/docs/display/ROS/Container). Container is Mikrotik's own implementation of Docker(TM), allowing users to run containerized environments within RouterOS.

This project is only recommended for research and testing purposes. Note the container can impact router performance: running a IPerf test of 50 Mbps via the container on a Mikrotik hAP ax3 consumes ~30% of the router's CPU.

The instructions below assume a use case for tailscale-enabled hosts accessing a router connected LAN subnet. Both Tailscale and Headscale control servers are supported.

Other site to site scenarios are outlined in the [project wiki](https://github.com/seanmamasde/tailscale-mikrotik/wiki).

## Requirements

The Mikrotik Container package is compatible with ARM, ARM64 and x86 architectures and the router must be be running RouterOS v7.6 or later. Refer to the [Mikrotik Container documentation](https://help.mikrotik.com/docs/display/ROS/Container) for recommendations, disclaimer and security risks. 

## Contributing

We welcome suggestions and feedback from people interested in integrating Tailscale on the RouterOS platform. Please send a PR or create an issue if you're having any problems.
