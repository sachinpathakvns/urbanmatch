
import 'dart:convert';

List<Urbanmatchcommit> urbanmatchcommitFromJson(String str) =>
    List<Urbanmatchcommit>.from(
        json.decode(str).map((x) => Urbanmatchcommit.fromJson(x)));

String urbanmatchcommitToJson(List<Urbanmatchcommit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Urbanmatchcommit {
  Urbanmatchcommit({
    this.sha,
    this.nodeId,
    this.commit,
    this.url,
    this.htmlUrl,
    this.commentsUrl,
    this.author,
    this.committer,
    this.parents,
  });

  String? sha;

  @override
  String toString() {
    return 'Urbanmatchcommit{sha: $sha, nodeId: $nodeId, commit: $commit, url: $url, htmlUrl: $htmlUrl, commentsUrl: $commentsUrl, author: $author, committer: $committer, parents: $parents}';
  }

  String? nodeId;
  Commit? commit;
  String? url;
  String? htmlUrl;
  String? commentsUrl;
  dynamic? author;
  dynamic? committer;
  List<Parent>? parents;

  factory Urbanmatchcommit.fromJson(Map<String, dynamic> json) =>
      Urbanmatchcommit(
        sha: json["sha"],
        nodeId: json["node_id"],
        commit: Commit.fromJson(json["commit"]),
        url: json["url"],
        htmlUrl: json["html_url"],
        commentsUrl: json["comments_url"],
        author: json["author"],
        committer: json["committer"],
        parents:
            List<Parent>.from(json["parents"].map((x) => Parent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "node_id": nodeId,
        "commit": commit?.toJson(),
        "url": url,
        "html_url": htmlUrl,
        "comments_url": commentsUrl,
        "author": author,
        "committer": committer,
        // "parents": List<dynamic>.from(parents?.map((x) => x.toJson())),
      };
}

class Commit {
  Commit({
    this.author,
    this.committer,
    this.message,
    this.tree,
    this.url,
    this.commentCount,
    this.verification,
  });

  Author? author;

  @override
  String toString() {
    return 'Commit{author: $author, committer: $committer, message: $message, tree: $tree, url: $url, commentCount: $commentCount, verification: $verification}';
  }

  Author? committer;
  String? message;
  Tree? tree;
  String? url;
  int? commentCount;
  Verification? verification;

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        author: Author.fromJson(json["author"]),
        committer: Author.fromJson(json["committer"]),
        message: json["message"],
        tree: Tree.fromJson(json["tree"]),
        url: json["url"],
        commentCount: json["comment_count"],
        verification: Verification.fromJson(json["verification"]),
      );

  Map<String, dynamic> toJson() => {
        "author": author?.toJson(),
        "committer": committer?.toJson(),
        "message": message,
        "tree": tree?.toJson(),
        "url": url,
        "comment_count": commentCount,
        "verification": verification?.toJson(),
      };
}

class Author {
  Author({
    this.name,
    this.email,
    this.date,
  });

  @override
  String toString() {
    return 'Author{name: $name, email: $email, date: $date}';
  }

  String? name;
  String? email;
  DateTime? date;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
        email: json["email"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "date": date?.toIso8601String(),
      };
}

class Tree {
  Tree({
    this.sha,
    this.url,
  });

  @override
  String toString() {
    return 'Tree{sha: $sha, url: $url}';
  }

  String? sha;
  String? url;

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        sha: json["sha"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
      };
}

class Verification {
  Verification({
    this.verified,
    this.reason,
    this.signature,
    this.payload,
  });

  @override
  String toString() {
    return 'Verification{verified: $verified, reason: $reason, signature: $signature, payload: $payload}';
  }

  bool? verified;
  String? reason;
  dynamic? signature;
  dynamic? payload;

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        verified: json["verified"],
        reason: json["reason"],
        signature: json["signature"],
        payload: json["payload"],
      );

  Map<String, dynamic> toJson() => {
        "verified": verified,
        "reason": reason,
        "signature": signature,
        "payload": payload,
      };
}

class Parent {
  Parent({
    this.sha,
    this.url,
    this.htmlUrl,
  });

  String? sha;

  @override
  String toString() {
    return 'Parent{sha: $sha, url: $url, htmlUrl: $htmlUrl}';
  }

  String? url;
  String? htmlUrl;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        sha: json["sha"],
        url: json["url"],
        htmlUrl: json["html_url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
        "html_url": htmlUrl,
      };
}
