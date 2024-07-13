import gleam/list

pub type Tree {
  None
  Node(data: Float, left: Tree, right: Tree)
}

pub fn insert(tree: Tree, new_data: Float) -> Tree {
  case tree {
    None -> Node(data: new_data, left: None, right: None)
    Node(data, left, right) -> {
      case new_data <=. data {
        True -> Node(data, insert(left, new_data), right)
        False -> Node(data, left, insert(right, new_data))
      }
    }
  }
}

pub fn to_list(tree: Tree) -> List(Float) {
  case tree {
    None -> []
    Node(data, left, right) -> {
      list.concat([to_list(left), [data], to_list(right)])
    }
  }
}
