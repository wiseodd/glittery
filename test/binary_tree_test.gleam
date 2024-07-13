import datastruct/binary_tree.{type Node}
import gleam/option.{type Option, None, Some}
import gleeunit/should

pub fn insert_test() {
  let tree: Option(Node) =
    None
    |> binary_tree.insert(6.0)
    |> binary_tree.insert(5.0)
    |> binary_tree.insert(7.0)

  tree |> should.be_some()

  case tree {
    Some(node) -> {
      should.equal(node.data, 6.0)

      case node.left {
        Some(node) -> should.equal(node.data, 5.0)
        None -> should.fail()
      }

      case node.right {
        Some(node) -> should.equal(node.data, 7.0)
        None -> should.fail()
      }
    }
    None -> should.fail()
  }
}

pub fn inorder_tree_walk_test() {
  let tree: Option(Node) =
    None
    |> binary_tree.insert(6.0)
    |> binary_tree.insert(5.0)
    |> binary_tree.insert(7.0)
    |> binary_tree.insert(2.0)
    |> binary_tree.insert(5.0)
    |> binary_tree.insert(8.0)

  binary_tree.to_list(tree) |> should.equal([2.0, 5.0, 5.0, 6.0, 7.0, 8.0])
}
