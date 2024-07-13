import datastruct/binary_tree.{type Tree}
import gleam/io
import gleeunit/should

pub fn insert_test() {
  let tree: Tree =
    binary_tree.None
    |> binary_tree.insert(6.0)
    |> binary_tree.insert(5.0)
    |> binary_tree.insert(7.0)

  tree |> should.not_equal(binary_tree.None)

  io.debug(tree)
  case tree {
    binary_tree.Node(data, left, right) -> {
      should.equal(data, 6.0)

      case left {
        binary_tree.Node(left_data, _, _) -> should.equal(left_data, 5.0)
        binary_tree.None -> should.fail()
      }

      case right {
        binary_tree.Node(right_data, _, _) -> should.equal(right_data, 7.0)
        binary_tree.None -> should.fail()
      }
    }
    binary_tree.None -> should.fail()
  }
}

pub fn inorder_tree_walk_test() {
  let tree: Tree =
    binary_tree.None
    |> binary_tree.insert(6.0)
    |> binary_tree.insert(5.0)
    |> binary_tree.insert(7.0)
    |> binary_tree.insert(2.0)
    |> binary_tree.insert(5.0)
    |> binary_tree.insert(8.0)

  binary_tree.to_list(tree) |> should.equal([2.0, 5.0, 5.0, 6.0, 7.0, 8.0])
}
