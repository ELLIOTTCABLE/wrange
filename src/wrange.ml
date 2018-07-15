module Person = struct
   type gender = Male | Female | Neither | Unspecified
   type colour = Black | White | Red | Orange | Yellow | Green | Blue | Indigo | Violet

   type person = {
      last_name : string;
      first_name : string;
      gender : gender;
      favourite_colour : colour;
      birthday : Js.Date.t;
   }
   type t = person

   module Js = struct
      type js = {
         last_name : string;
         first_name : string;
         gender : gender;
         favourite_colour : colour;
         birthday : Js.Date.t;
      } [@@bs.deriving abstract]
      type t = js

      let of_person (person : person) : js =
         failwith "NYI"

   end

   let create ~last_name ~first_name ~gender ~favourite_colour ~birthday =
      {
         last_name = last_name;
         first_name = first_name;
         gender = gender;
         favourite_colour = favourite_colour;
         birthday = birthday;
      }

   let of_object (obj : Js.t) : person =
      create
         ~last_name:(Js.last_nameGet obj)
         ~first_name:(Js.first_nameGet obj)
         ~gender:(Js.genderGet obj)
         ~favourite_colour:(Js.favourite_colourGet obj)
         ~birthday:(Js.birthdayGet obj)
end
