import datastruct/bst
import gleam/float
import gleam/io
import gleam/list

pub fn main() {
  let tree: bst.Tree =
    bst.None
    |> bst.insert(6.0)
    |> bst.insert(5.0)
    |> bst.insert(7.0)
    |> bst.insert(2.0)
    |> bst.insert(5.0)
    |> bst.insert(8.0)

  list.each(bst.to_list(tree), fn(x) { io.print(float.to_string(x) <> " ") })
}
