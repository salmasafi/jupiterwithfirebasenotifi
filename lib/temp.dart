/* Future<void> adUserModelToFireBase() async {
    final r = RetryOptions(maxAttempts: 5);

    try {
      await r.retry(
        () async {
          DocumentReference employeeDoc = FirebaseFirestore.instance
              .collection('Employees')
              .doc(widget.userModel.id)
              .collection('data')
              .doc('api_data');
          DocumentSnapshot employeeSnapshot = await employeeDoc.get();

          if (!employeeSnapshot.exists) {
            await employeeDoc.set({
              'studentName': widget.userModel.studentName,
              'nickname': widget.userModel.nickname,
              'phone': widget.userModel.phone,
              'studentWhatsApp': widget.userModel.studentWhatsApp,
              'school': widget.userModel.school,
              'comment': widget.userModel.comment,
              'age': widget.userModel.age,
              'studentBatches': widget.userModel.studentBatches,
              'enrollments': widget.userModel.enrollments,
              'name': widget.userModel.name,
              'role': widget.userModel.role,
              'address': widget.userModel.address,
              'whatsApp': widget.userModel.whatsApp,
              'isActive': widget.userModel.isActive,
              'jupiterCoins': widget.userModel.jupiterCoins,
              'getStartedAt': widget.userModel.getStartedAt,
              'branch': widget.userModel.branch,
              'dateOfBirth': widget.userModel.dateOfBirth,
              'profileImagePath': widget.userModel.profileImagePath,
              'assignedByTasks': widget.userModel.assignedByTasks,
              'assignedToTasks': widget.userModel.assignedToTasks,
              'requests': widget.userModel.requests,
              'id': widget.userModel.id,
              'userName': widget.userModel.userName,
              'normalizedUserName': widget.userModel.normalizedEmail,
              'email': widget.userModel.email,
              'normalizedEmail': widget.userModel.normalizedEmail,
              'emailConfirmed': widget.userModel.emailConfirmed,
              'passwordHash': widget.userModel.passwordHash,
              'securityStamp': widget.userModel.securityStamp,
              'concurrencyStamp': widget.userModel.concurrencyStamp,
              'phoneNumber': widget.userModel.phoneNumber,
              'phoneNumberConfirmed': widget.userModel.phoneNumberConfirmed,
              'twoFactorEnabled': widget.userModel.twoFactorEnabled,
              'lockoutEnd': widget.userModel.lockoutEnd,
              'lockoutEnabled': widget.userModel.lockoutEnabled,
              'accessFailedCount': widget.userModel.accessFailedCount,
            });
          }
        },
        retryIf: (e) => e is FirebaseException && e.code == 'unavailable',
      );
    } catch (e) {
      print('Failed to add user data: $e');
    }
  }
  @override
  void initState() {
    adUserModelToFireBase();
    super.initState();
  } */


  /*
                            DocumentReference employeeDoc = FirebaseFirestore
                                .instance
                                .collection('Employees')
                                .doc(widget.userModel.id)
                                .collection('data')
                                .doc('api_data');
                            DocumentSnapshot employeeSnapshot =
                                await employeeDoc.get();

                            if (!employeeSnapshot.exists) {
                              await employeeDoc.set({
                                'studentName': widget.userModel.studentName,
                                'nickname': widget.userModel.nickname,
                                'phone': widget.userModel.phone,
                                'studentWhatsApp':
                                    widget.userModel.studentWhatsApp,
                                'school': widget.userModel.school,
                                'comment': widget.userModel.comment,
                                'age': widget.userModel.age,
                                'studentBatches':
                                    widget.userModel.studentBatches,
                                'enrollments': widget.userModel.enrollments,
                                'name': widget.userModel.name,
                                'role': widget.userModel.role,
                                'address': widget.userModel.address,
                                'whatsApp': widget.userModel.whatsApp,
                                'isActive': widget.userModel.isActive,
                                'jupiterCoins': widget.userModel.jupiterCoins,
                                'getStartedAt': widget.userModel.getStartedAt,
                                'branch': widget.userModel.branch,
                                'dateOfBirth': widget.userModel.dateOfBirth,
                                'profileImagePath':
                                    widget.userModel.profileImagePath,
                                'assignedByTasks':
                                    widget.userModel.assignedByTasks,
                                'assignedToTasks':
                                    widget.userModel.assignedToTasks,
                                'requests': widget.userModel.requests,
                                'id': widget.userModel.id,
                                'userName': widget.userModel.userName,
                                'normalizedUserName':
                                    widget.userModel.normalizedEmail,
                                'email': widget.userModel.email,
                                'normalizedEmail':
                                    widget.userModel.normalizedEmail,
                                'emailConfirmed':
                                    widget.userModel.emailConfirmed,
                                'passwordHash': widget.userModel.passwordHash,
                                'securityStamp': widget.userModel.securityStamp,
                                'concurrencyStamp':
                                    widget.userModel.concurrencyStamp,
                                'phoneNumber': widget.userModel.phoneNumber,
                                'phoneNumberConfirmed':
                                    widget.userModel.phoneNumberConfirmed,
                                'twoFactorEnabled':
                                    widget.userModel.twoFactorEnabled,
                                'lockoutEnd': widget.userModel.lockoutEnd,
                                'lockoutEnabled':
                                    widget.userModel.lockoutEnabled,
                                'accessFailedCount':
                                    widget.userModel.accessFailedCount,
                              });
                            } */