import gleam/list

pub type Tree {
  None
  Node(key: Float, left: Tree, right: Tree)
}

pub fn insert(tree: Tree, new_key: Float) -> Tree {
  case tree {
    None -> Node(key: new_key, left: None, right: None)
    Node(key, left, right) if new_key <=. key ->
      Node(key, insert(left, new_key), right)
    Node(key, left, right) -> Node(key, left, insert(right, new_key))
  }
}

pub fn to_list(tree: Tree) -> List(Float) {
  case tree {
    None -> []
    Node(key, left, right) -> {
      list.concat([to_list(left), [key], to_list(right)])
    }
  }
}

pub fn find(tree: Tree, new_key: Float) -> Tree {
  case tree {
    None -> None
    Node(key, _, _) if new_key == key -> tree
    Node(key, left, _) if new_key <=. key -> find(left, new_key)
    Node(_, _, right) -> find(right, new_key)
  }
}

pub fn find_parent(tree: Tree, new_key: Float) -> Tree {
  case tree {
    None -> None
    Node(key, _, _) if new_key == key -> tree
    Node(key, left, _) if new_key <=. key -> find(left, new_key)
    Node(_, _, right) -> find(right, new_key)
  }
}
