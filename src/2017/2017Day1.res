open Belt

let input = Node.Fs.readFileAsUtf8Sync("./src/2017/input/day1.txt")->Js.String2.split("")

let parse = (data, step) => {
  data
  ->Array.mapWithIndex((idx, item) => {
    switch data[mod(idx + step, data->Array.length)] {
    | None when item == data->Array.getExn(0) => item->Int.fromString
    | Some(next) when item == next => item->Int.fromString
    | _ => None
    }
  })
  ->Array.keep(x => x != None)
}

let part1 = input->parse(1)->Array.reduce(0, (acc, item) => acc + item->Option.getExn)
part1->Js.log

let part2 =
  input->parse(input->Array.length / 2)->Array.reduce(0, (acc, item) => acc + item->Option.getExn)
part2->Js.log
