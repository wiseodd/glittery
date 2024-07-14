import datastruct/bst.{type Tree}
import gleeunit/should

fn get_tree() -> Tree {
  bst.None
  |> bst.insert(6.0)
  |> bst.insert(5.0)
  |> bst.insert(7.0)
  |> bst.insert(2.0)
  |> bst.insert(5.0)
  |> bst.insert(8.0)
}

pub fn insert_test() {
  let tree: Tree =
    bst.None
    |> bst.insert(6.0)
    |> bst.insert(5.0)
    |> bst.insert(7.0)

  tree |> should.not_equal(bst.None)

  case tree {
    bst.Node(key, left, right) -> {
      should.equal(key, 6.0)

      case left {
        bst.Node(left_key, _, _) -> should.equal(left_key, 5.0)
        bst.None -> should.fail()
      }

      case right {
        bst.Node(right_key, _, _) -> should.equal(right_key, 7.0)
        bst.None -> should.fail()
      }
    }
    bst.None -> should.fail()
  }
}

pub fn inorder_tree_walk_test() {
  let tree = get_tree()
  bst.to_list(tree) |> should.equal([2.0, 5.0, 5.0, 6.0, 7.0, 8.0])
}

pub fn find_test() {
  let tree = get_tree()

  case bst.find(tree, 7.0) {
    bst.Node(key, _, _) -> key |> should.equal(7.0)
    bst.None -> should.fail()
  }

  case bst.find(tree, 10.0) {
    bst.Node(_, _, _) -> should.fail()
    bst.None -> should.be_true(True)
  }
}
