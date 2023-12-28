class emp {
  bool? success;
  List<EmployeeList>? employeeList;

  emp({this.success, this.employeeList});

  emp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['employeeList'] != null) {
      employeeList = <EmployeeList>[];
      json['employeeList'].forEach((v) {
        employeeList!.add(new EmployeeList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.employeeList != null) {
      data['employeeList'] = this.employeeList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeeList {
  int? employeeId;
  String? employeeName;
  String? mobile;
  String? userName;
  String? password;
  String? confirmPassword;
  String? removedOn;
  String? removedRemarks;
  int? createdBy;
  String? deviceId;

  EmployeeList(
      {this.employeeId,
        this.employeeName,
        this.mobile,
        this.userName,
        this.password,
        this.confirmPassword,
        this.removedOn,
        this.removedRemarks,
        this.createdBy,
        this.deviceId});

  EmployeeList.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    employeeName = json['employeeName'];
    mobile = json['mobile'];
    userName = json['userName'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    removedOn = json['removedOn'];
    removedRemarks = json['removedRemarks'];
    createdBy = json['createdBy'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['employeeName'] = this.employeeName;
    data['mobile'] = this.mobile;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    data['removedOn'] = this.removedOn;
    data['removedRemarks'] = this.removedRemarks;
    data['createdBy'] = this.createdBy;
    data['deviceId'] = this.deviceId;
    return data;
  }
}
