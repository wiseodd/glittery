import datastruct/binary_tree.{type Node}
import gleam/float
import gleam/io
import gleam/list
import gleam/option.{type Option, None}

pub fn main() {
  let tree: Option(Node) =
    None
    |> binary_tree.insert(6.0)
    |> binary_tree.insert(5.0)
    |> binary_tree.insert(7.0)
    |> binary_tree.insert(2.0)
    |> binary_tree.insert(5.0)
    |> binary_tree.insert(8.0)

  list.each(binary_tree.to_list(tree), fn(x) {
    io.print(float.to_string(x) <> " ")
  })
}
