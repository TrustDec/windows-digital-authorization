
#### 2018/07/07 v1.0-beta.5:

  1. Support automatic judgment and install skus certificate.
```log
    a).The script will automatically detect which version you choose to activate, whether there is a certificate in the skus b).directory, and activate it if it exists.

    c).If there is no certificate in the skus directory, the script will automatically install the corresponding version of the certificate, and the activation will be completed after the installation.

    d).There is currently a certificate with 1709=16299 1803=17134.

    e).And 1607=14393 LTSB certificate.
```
2. Option 2 custom activation has the original input KEY, instead enter the letter selection menu.
3. Run gatherosstate.exe in Win7 compatibility mode to get the collective name of gatherosstate.xml. (Thanks to 940L @wxgx for providing original information on foreign posts)
4. Continue to add some hints to the script.
5. new support to activate EnterpriseN and EnterpriseSN




#### 2018/07/05 v1.0-beta.4:

1. Change the SKU import method. There are automatic acquisitions from the second edition to the fourth edition, and the SKU value is specified in the script.
2. Fixed the bug that the professional education version could not be activated (thanks to the feedback from 642L @dizhu102 and 537L @oscar26981289).
3. Support the use of script activation after importing other versions of the certificate. (The supported version needs to be within the scope of script support).
Note: EnterpriseN and LTSB2016N do not support, and LTSB2016 should not support conversion.
4. Adjust the version information display mode.
5. Continue to optimize and supplement the hints of a small number of scripts.



#### 2018/07/04 v1.0-beta.3:

1. Add a new judgment to see if the Windows Update service is disabled.
If the Update service is found to be disabled, the script will be set to automatically start the Update service and start the Update service.
After the activation is completed, the Update service is automatically disabled, and the Update service is restored to its original state. (Thanks to 301L @Younhem for his advice).
2, add the installation KEY option, install the KEY option only install KEY and do not do other operations.
3. Start the Windows Update service automatically before starting the activation.
4, modify the custom input KEY activation import registry SKU value error.
5. Fix the problem of the KEY version error listed in the custom activation meeting.


#### 2018/07/03 v1.0-beta.2:

1. Add the input KEY option, the user can choose to activate the currently used version or enter KEY to activate other versions. (Thanks to 184L @maomihuacha for advice)
2. Add the current system version information.
3. The batch script adds menu options.
4. After the activation is activated, the non-Simplified Chinese system does not display partial key problems.
5. Enter KEY to see the supported version of the public KEY, which is convenient for users to copy and paste.
6. Uninstall the current system key.
7. Add an access script to post the post URL.
8, supplement the batch script part of the prompt information.



#### 2018/07/01 v1.0-beta.1:

1. Determine if the system has been permanently activated and add multi-language support. (Thanks for the feedback from 46L @WrongREqia0 and the help of 73L).
2. Fix the Chinese flag of the PRofessionalWorkstationN tag. (Thanks to 46L @WrongREqia0 for feedback).
3. Display system version information after adding new activation.


