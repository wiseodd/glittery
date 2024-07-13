import gleam/list
import gleam/option.{type Option, None, Some}

pub type Node {
  Node(
    data: Float,
    left: Option(Node),
    right: Option(Node),
    parent: Option(Node),
  )
}

pub type TreeWalkOrder {
  PreOrder
  InOrder
  PostOrder
}

pub fn insert(root: Option(Node), data: Float) -> Option(Node) {
  case root {
    None -> Some(Node(data: data, left: None, right: None, parent: None))
    Some(node) -> {
      case node.data >=. data {
        True ->
          Some(Node(node.data, insert(node.left, data), node.right, Some(node)))
        False ->
          Some(Node(node.data, node.left, insert(node.right, data), Some(node)))
      }
    }
  }
}

pub fn to_list(root: Option(Node)) -> List(Float) {
  case root {
    None -> []
    Some(Node(data, left, right, _parent)) -> {
      list.concat([to_list(left), [data], to_list(right)])
    }
  }
}
