# tor-privoxy-docker

[![0.1.0](http://img.shields.io/github/tag/gp3t1/tor-privoxy-docker.svg)](https://github.com/gp3t1/tor-privoxy-docker/tags) [![Repository issues](http://issuestats.com/github/gp3t1/tor-privoxy-docker/badge/issue)](http://issuestats.com/github/gp3t1/tor-privoxy-docker)

HTTP+SOCKS5 Tor [proxy](https://www.torproject.org) (with [privoxy](https://www.privoxy.org/))

## Installation

* Install docker

## Usage

Here's a short explanation how to use `tor-privoxy-docker`:

* Quickstart:
	
	The following command start a socks5 proxy(on localhost:`http_port`) and an http proxy(on localhost:`socks5_port`) to the tor network: 

		docker run --rm -d -p <http_port>:8118 -p <socks5_port>:9050 gp3t1/tor-privoxy[:<tag>] connect

* More options:
	
	- Limit access to your proxy:

			-e ACCEPT_FROM="[HOST|NETWORK][;[HOST|NETWORK]...]"
			(e.g. "172.17.0.1", "172.17.0.1;172.17.0.5", "172.17.0.0/24")
			defaults to your docker subnetwork

	- Open access to tor built-in dns server:

			-p 9053:9053

	- Open access to the tor controller on localhost:`controller_port`:
		
			-e TORCTRL_PASS="<your_password>"
			-p <controller_port>:9051

	- Force packages update at launch:

			-e REFRESH=true (default:false)

	- Set verbosity:

			-e VERBOSE=<0|1|2> (default:0)

## Contributing

1. Fork it
2. Create your feature branch: `git checkout -b feature/my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature/my-new-feature`
5. Submit a pull request

## Requirements / Dependencies

* [docker engine](https://docs.docker.com/engine/installation/) > 1.10

## Version

0.1.0

## License

Copyright (C) <year> <name of author>

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.