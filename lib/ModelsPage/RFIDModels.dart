class RfidResponse {
  final int status;
  final String msg;
  final Records records;
  final String balance;
  final String mainMemberName;

  RfidResponse({
    required this.status,
    required this.msg,
    required this.records,
    required this.balance,
    required this.mainMemberName,
  });

  factory RfidResponse.fromJson(Map<String, dynamic> json) {
    return RfidResponse(
      status: json['Status'] ?? 0,
      msg: json['Msg'] ?? '',
      records: Records.fromJson(json['Records'] ?? {}),
      balance: json['Balance'] ?? '',
      mainMemberName: json['main_member_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "Status": status,
      "Msg": msg,
      "Records": records.toJson(),
      "Balance": balance,
      "main_member_name": mainMemberName,
    };
  }
}

class Records {
  final String memberId;
  final String? icNo;
  final String? servingVeteran;
  final String? unit;
  final String memberType;
  final String memberCardtype;
  final String memberPrivilege;
  final String memberHavecard;
  final String? memberTempfromdate;
  final String? memberTemptodate;
  final String memberCode;
  final String memberNo;
  final String memberRfid;
  final String memberPre;
  final String memberFname;
  final String memberLname;
  final String? memberGender;
  final String memberFathername;
  final String memberEmail;
  final String memberMobile;
  final String memberPass;
  final String memberDob;
  final String memberAnniversary;
  final String memberPaddress;
  final String? memberPcountry;
  final String? memberPstate;
  final String? memberPcity;
  final String? memberPzipcode;
  final String? memberBilladdress;
  final String memberBillcountry;
  final String memberBillstate;
  final String? memberBillcity;
  final String? memberBillzipcode;
  final String memberRemark;
  final String? memberRfcardassigndate;
  final String? memberModifydate;
  final String memberStatus;
  final String memberBalance;
  final String memberImg;
  final String memberRelation;
  final String memberMaxPeg;
  final String memberUtype;
  final String memberPassStatus;
  final String? memberMpin;
  final String maritalStatus;
  final String consy;
  final String keptaMember;
  final String cardType;
  final String securityDeposit;
  final String samraFee;
  final String memberQr;
  final String memberQrcode;
  final String? memberInitial;
  final String memberAdd2;
  final String memberAdd3;
  final String memberCity;
  final String? memberPhoneOff;
  final String? memberWifeName;
  final String? memberNoChilds;
  final String memberClubStatus;
  final String? createdBy;
  final String memberPhone;
  final String occupation;
  final String designation;
  final String? memberBalanceMonthly;
  final String? memberEntryStatus;
  final String? memberChangepass;
  final String? memberSubmemberCount;
  final String? branch;
  final String? descipline;
  final String? bloodgroup;
  final String memberRank;

  Records({
    required this.memberId,
    this.icNo,
    this.servingVeteran,
    this.unit,
    required this.memberType,
    required this.memberCardtype,
    required this.memberPrivilege,
    required this.memberHavecard,
    this.memberTempfromdate,
    this.memberTemptodate,
    required this.memberCode,
    required this.memberNo,
    required this.memberRfid,
    required this.memberPre,
    required this.memberFname,
    required this.memberLname,
    this.memberGender,
    required this.memberFathername,
    required this.memberEmail,
    required this.memberMobile,
    required this.memberPass,
    required this.memberDob,
    required this.memberAnniversary,
    required this.memberPaddress,
    this.memberPcountry,
    this.memberPstate,
    this.memberPcity,
    this.memberPzipcode,
    this.memberBilladdress,
    required this.memberBillcountry,
    required this.memberBillstate,
    this.memberBillcity,
    this.memberBillzipcode,
    required this.memberRemark,
    this.memberRfcardassigndate,
    this.memberModifydate,
    required this.memberStatus,
    required this.memberBalance,
    required this.memberImg,
    required this.memberRelation,
    required this.memberMaxPeg,
    required this.memberUtype,
    required this.memberPassStatus,
    this.memberMpin,
    required this.maritalStatus,
    required this.consy,
    required this.keptaMember,
    required this.cardType,
    required this.securityDeposit,
    required this.samraFee,
    required this.memberQr,
    required this.memberQrcode,
    this.memberInitial,
    required this.memberAdd2,
    required this.memberAdd3,
    required this.memberCity,
    this.memberPhoneOff,
    this.memberWifeName,
    this.memberNoChilds,
    required this.memberClubStatus,
    this.createdBy,
    required this.memberPhone,
    required this.occupation,
    required this.designation,
    this.memberBalanceMonthly,
    this.memberEntryStatus,
    this.memberChangepass,
    this.memberSubmemberCount,
    this.branch,
    this.descipline,
    this.bloodgroup,
    required this.memberRank,
  });

  factory Records.fromJson(Map<String, dynamic> json) {
    return Records(
      memberId: json['member_id'] ?? '',
      icNo: json['IC_no'],
      servingVeteran: json['serving_veteran'],
      unit: json['unit'],
      memberType: json['member_type'] ?? '',
      memberCardtype: json['member_cardtype'] ?? '',
      memberPrivilege: json['member_privilege'] ?? '',
      memberHavecard: json['member_havecard'] ?? '',
      memberTempfromdate: json['member_tempfromdate'],
      memberTemptodate: json['member_temptodate'],
      memberCode: json['member_code'] ?? '',
      memberNo: json['member_no'] ?? '',
      memberRfid: json['member_rfid'] ?? '',
      memberPre: json['member_pre'] ?? '',
      memberFname: json['member_fname'] ?? '',
      memberLname: json['member_lname'] ?? '',
      memberGender: json['member_gender'],
      memberFathername: json['member_fathername'] ?? '',
      memberEmail: json['member_email'] ?? '',
      memberMobile: json['member_mobile'] ?? '',
      memberPass: json['member_pass'] ?? '',
      memberDob: json['member_dob'] ?? '',
      memberAnniversary: json['member_anniversary'] ?? '',
      memberPaddress: json['member_paddress'] ?? '',
      memberPcountry: json['member_pcountry'],
      memberPstate: json['member_pstate'],
      memberPcity: json['member_pcity'],
      memberPzipcode: json['member_pzipcode'],
      memberBilladdress: json['member_billaddress'],
      memberBillcountry: json['member_billcountry'] ?? '',
      memberBillstate: json['member_billstate'] ?? '',
      memberBillcity: json['member_billcity'],
      memberBillzipcode: json['member_billzipcode'],
      memberRemark: json['member_remark'] ?? '',
      memberRfcardassigndate: json['member_rfcardassigndate'],
      memberModifydate: json['member_modifydate'],
      memberStatus: json['member_status'] ?? '',
      memberBalance: json['member_balance'] ?? '',
      memberImg: json['member_img'] ?? '',
      memberRelation: json['member_relation'] ?? '',
      memberMaxPeg: json['member_max_peg'] ?? '',
      memberUtype: json['member_utype'] ?? '',
      memberPassStatus: json['member_pass_status'] ?? '',
      memberMpin: json['member_mpin'],
      maritalStatus: json['marital_status'] ?? '',
      consy: json['consy'] ?? '',
      keptaMember: json['kepta_member'] ?? '',
      cardType: json['card_type'] ?? '',
      securityDeposit: json['security_deposit'] ?? '',
      samraFee: json['samra_fee'] ?? '',
      memberQr: json['member_qr'] ?? '',
      memberQrcode: json['member_qrcode'] ?? '',
      memberInitial: json['member_initial'],
      memberAdd2: json['member_add2'] ?? '',
      memberAdd3: json['member_add3'] ?? '',
      memberCity: json['member_city'] ?? '',
      memberPhoneOff: json['member_phone_off'],
      memberWifeName: json['member_wife_name'],
      memberNoChilds: json['member_no_childs'],
      memberClubStatus: json['member_club_status'] ?? '',
      createdBy: json['created_by'],
      memberPhone: json['member_phone'] ?? '',
      occupation: json['occupation'] ?? '',
      designation: json['designation'] ?? '',
      memberBalanceMonthly: json['member_balance_monthly'],
      memberEntryStatus: json['member_entry_status'],
      memberChangepass: json['member_changepass'],
      memberSubmemberCount: json['member_submember_count'],
      branch: json['branch'],
      descipline: json['descipline'],
      bloodgroup: json['bloodgroup'],
      memberRank: json['member_rank'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "member_id": memberId,
      "IC_no": icNo,
      "serving_veteran": servingVeteran,
      "unit": unit,
      "member_type": memberType,
      "member_cardtype": memberCardtype,
      "member_privilege": memberPrivilege,
      "member_havecard": memberHavecard,
      "member_tempfromdate": memberTempfromdate,
      "member_temptodate": memberTemptodate,
      "member_code": memberCode,
      "member_no": memberNo,
      "member_rfid": memberRfid,
      "member_pre": memberPre,
      "member_fname": memberFname,
      "member_lname": memberLname,
      "member_gender": memberGender,
      "member_fathername": memberFathername,
      "member_email": memberEmail,
      "member_mobile": memberMobile,
      "member_pass": memberPass,
      "member_dob": memberDob,
      "member_anniversary": memberAnniversary,
      "member_paddress": memberPaddress,
      "member_pcountry": memberPcountry,
      "member_pstate": memberPstate,
      "member_pcity": memberPcity,
      "member_pzipcode": memberPzipcode,
      "member_billaddress": memberBilladdress,
      "member_billcountry": memberBillcountry,
      "member_billstate": memberBillstate,
      "member_billcity": memberBillcity,
      "member_billzipcode": memberBillzipcode,
      "member_remark": memberRemark,
      "member_rfcardassigndate": memberRfcardassigndate,
      "member_modifydate": memberModifydate,
      "member_status": memberStatus,
      "member_balance": memberBalance,
      "member_img": memberImg,
      "member_relation": memberRelation,
      "member_max_peg": memberMaxPeg,
      "member_utype": memberUtype,
      "member_pass_status": memberPassStatus,
      "member_mpin": memberMpin,
      "marital_status": maritalStatus,
      "consy": consy,
      "kepta_member": keptaMember,
      "card_type": cardType,
      "security_deposit": securityDeposit,
      "samra_fee": samraFee,
      "member_qr": memberQr,
      "member_qrcode": memberQrcode,
      "member_initial": memberInitial,
      "member_add2": memberAdd2,
      "member_add3": memberAdd3,
      "member_city": memberCity,
      "member_phone_off": memberPhoneOff,
      "member_wife_name": memberWifeName,
      "member_no_childs": memberNoChilds,
      "member_club_status": memberClubStatus,
      "created_by": createdBy,
      "member_phone": memberPhone,
      "occupation": occupation,
      "designation": designation,
      "member_balance_monthly": memberBalanceMonthly,
      "member_entry_status": memberEntryStatus,
      "member_changepass": memberChangepass,
      "member_submember_count": memberSubmemberCount,
      "branch": branch,
      "descipline": descipline,
      "bloodgroup": bloodgroup,
      "member_rank": memberRank,
    };
  }
}
