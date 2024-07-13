import datastruct/binary_tree
import gleam/float
import gleam/io
import gleam/list

pub fn main() {
  let tree: binary_tree.Tree =
    binary_tree.None
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
