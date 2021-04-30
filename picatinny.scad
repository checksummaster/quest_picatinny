/*
 Picatinny rail for G36 airsoft gun
 By Stuart Livings, Matthew Roberts. (C) 2010

 This work is free software; you can redistribute it and/or modify it under
 the terms of the GNU General Public License as published by the Free Software
 Foundation; version 2.

 This work is distributed in the hope that it will be useful, but WITHOUT ANY
 WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 A PARTICULAR PURPOSE. See the version 2 of the GNU General Public License for
 more details.
 */



rail(3);

module rail(sections) {
	translate(v = [0, 0, -5 * sections - 2.5]) difference() {
		linear_extrude(height = 5 + (10 * sections)) railprofile();
		union() {
			for (s = [1:sections]) {
				translate(v = [0, 0, 10 * s - 5]) linear_extrude(height = 5) cutprofile();
			}
		}
	}
}

module railprofile() {
	polygon(points=[[-10.6,0],[-8.4,2.2],[8.4,2.2],[10.6,0],[7.8,-2.8],[7.8,-6.8],[-7.8,-6.8],[-7.8,-2.8]], paths=[[0,1,2,3,4,5,6,7,0]]);
}

module cutprofile() {
	polygon(points=[[-12, -0.8], [-12, 3], [12, 3], [12, -0.8]], paths=[[0,1,2,3,0]]);
}
