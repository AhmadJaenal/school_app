class PaginationResult<T> {
  final List<T> data;
  final PaginationInfo pagination;

  PaginationResult({required this.data, required this.pagination});
}

class PaginationInfo {
  int? page;
  int? limit;
  int? offset;
  int? totalPages;
  int? nextPage;
  int? prevPage;

  PaginationInfo({
    this.page,
    this.limit,
    this.offset,
    this.totalPages,
    this.nextPage,
    this.prevPage,
  });

  PaginationInfo.fromJson(dynamic json) {
    page = json['page'];
    limit = json['limit'];
    offset = json['offset'];
    totalPages = json['totalPages'];
    nextPage = json['nextPage'];
    prevPage = json['prevPage'];
  }
}
