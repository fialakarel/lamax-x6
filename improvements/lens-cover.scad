/**
 *    Lamax x6 -- lens cover
 * 
 *    @author        Karel Fiala
 *    @email         fiala.karel@gmail.com
 */

$fn=300;

module lamax_x6_lens_cover() {

    width = 21/2;
    heigh = 10;
    wall = 0.7;
    space = 0.3;

    inner = width + space;
    outer = inner + wall;

    difference() {
        translate([0, 0, -0.7]) cylinder(r1=outer, r2=outer, h=heigh + wall, center = true);
        cylinder(r1=inner, r2=inner, h=heigh + wall, center = true);
    }

}


// calling
lamax_x6_lens_cover();