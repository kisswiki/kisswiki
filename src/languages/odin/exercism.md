## two fer

Print

`import "core:fmt"`

fmt.print - to stdout

fmt.tprint - returns string

fmt.aprint - like tprint but allows specyfing allocator

printf, tprintf, aprintf - uses format string, like template with `%v` for default formatter, `%s` for string

there is also println, eprintln, printfln etc.

- file:///Users/romanfrolow/Downloads/odin_book_1_9.html#construct-strings-using-fmt
- https://odin-lang.org/docs/overview/#hellope
- https://pkg.odin-lang.org/core/fmt/
- print with caller location https://odin-lang.org/docs/overview/#caller_location
- https://odin-lang.org/docs/overview/#caller_expression-or-caller_expressionparam

## space age

map is dynamic, so have to be created in function, not at the top level of file.

Unless you add directive.

Or use fixed array enumerated.

```odin
Planet :: enum {
	Mercury,
	Venus,
}

// Use fixed array indexed by enum
// https://exercism.org/tracks/odin/exercises/space-age/solutions/gspitz01
// https://odin-lang.org/docs/overview/#enumerated-array
// https://odin-lang.org/docs/overview/#rodata
//@(rodata)
ratios_fixed_array_enumerated := [Planet]f64 {
	.Mercury = 0.2408467,
	.Venus   = 0.61519726,
	.Earth   = 1.0,
	.Mars    = 1.8808158,
	.Jupiter = 11.862615,
	.Saturn  = 29.447498,
	.Uranus  = 84.016846,
	.Neptune = 164.79132,
}

#+feature dynamic-literals
// https://odin-lang.org/docs/overview/#feature
// https://odin-lang.org/docs/overview/#maps

EarthYearsPerPlanetYear := map[Planet]f64 {
	.Mercury = 0.2408467,
	.Venus   = 0.61519726,
}

age :: proc(planet: Planet, seconds: int) -> f64 {
	years: f64 = f64(seconds) / 60 / 60 / 24 / 365.25
	ratios := make(map[Planet]f64)
	defer delete(ratios)

	ratios[.Mercury] = 0.2408467
	ratios[.Venus] = 0.61519726
	return years / ratios[planet]
}

EARTH_YEAR :: 31_557_600
//EARTH_YEAR : f64 : 31_557_600
//SECONDS_IN_EARTH_YEAR :: 365.25 * 24 * 3600
age_using_switch :: proc(planet: Planet, seconds: int) -> f64 {
	//seconds_per_earth_year : f64 = 365.25 * 24 * 60 * 60 
	factor: f64 = 1

	switch planet {
		case .Mercury: factor = 0.2408467
		case .Venus: factor = 0.61519726
		case .Mars: factor = 1.8808158
		case .Jupiter: factor = 11.862615
		case .Saturn: factor = 29.447498
		case .Uranus: factor = 84.016846
		case .Neptune: factor = 164.79132
		case .Earth: factor = 1

	}
	//return f64(seconds) / (seconds_per_earth_year * factor) 
	return f64(seconds) / (EARTH_YEAR * factor)
}

EARTH_YEAR_SECONDS := [8]f64{
    Planet.Mercury = 0.2408467,
    Planet.Venus   = 0.61519726,
    Planet.Earth   = 1,
    Planet.Mars    = 1.8808158,
    Planet.Jupiter = 11.862615,
    Planet.Saturn  = 29.447498,
    Planet.Uranus  = 84.016846,
    Planet.Neptune = 164.79132,
} * 31557600

package space_age

Planet :: enum {
	Mercury,
	Venus,
	Earth,
	Mars,
	Jupiter,
	Saturn,
	Uranus,
	Neptune,
}

// https://odin-lang.org/docs/overview/#static
get_orbital_period :: proc(planet: Planet) -> f64 {
    @(static) periods := [Planet]f64 {
        .Mercury = 31557600 * 0.2408467,
        .Venus   = 31557600 * 0.61519726,
        .Earth   = 31557600 * 1.0,
        .Mars    = 31557600 * 1.8808158,
        .Jupiter = 31557600 * 11.862615,
        .Saturn  = 31557600 * 29.447498,
        .Uranus  = 31557600 * 84.016846,
        .Neptune = 31557600 * 164.79132,
    }

    return periods[planet]
}
```
