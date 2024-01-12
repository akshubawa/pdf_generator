import 'package:agarwal_packers/app/database.dart';
import 'package:agarwal_packers/services/pdf_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

final _quotationKey = GlobalKey<FormState>();

class BillView extends StatefulWidget {
  const BillView({super.key});

  @override
  State<BillView> createState() => _BillViewState();
}

class _BillViewState extends State<BillView> {
  final PdfService pdfService = PdfService();

  String? validateInputBox(String? value) {
    if (value!.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  uploadQuotationData() async {
    Map<String, dynamic> uploadData = {
      "Transport_From": transportFromController.text,
      "Transport_To": transportToController.text,
      "Movement Date": DateFormat('dd-MM-yyyy').format(_dateTime),
      "Movement Time": _timeOfDay.format(context),
      "Vehicle Type": vehicleType,
      "Name": nameController.text,
      "Address": addressController.text,
      "Mobile": mobileController.text,
      "Email": emailController.text,
      "Company Name": companyNameController.text,
      "GST No.": gstNumberController.text,
      "Remark": remarkController.text,
      "Packing Charges": packingChargesController.text,
      "Freight Charges": freightChargesController.text,
      "Loading Charges": loadingChargesController.text,
      "Floor Type": floorType,
      "Unloading Charges": unloadingChargesController.text,
      "Unpacking Charges": unpackingChargesController.text,
      "Escort Charges": escortChargesController.text,
      "Frieght Charges for Loading & Unloading":
          loadingUnloadingChargesController.text,
      "Freight on Value": freightOnValueController.text,
      "Statistical Charges": statisticalChargesController.text,
      "Surcharge": surchargeController.text,
      "Other Charges": otherChargesController.text,
      "Mathadi paid by Client": mathadiController.text,
      "Storage Charges": storageChargesController.text,
      "GST Charges": gstChargesController.text,
    };

    // Map<String, dynamic> updatedQuotationData = {
    //   for (var entry in uploadQuotationData.entries)
    //     entry.key: entry.value.isEmpty ? '0' : entry.value,
    // };

    DatabaseMethods().addQuotation(uploadData);
  }

  final List<String> vehicleTypeList = [
    'Part Load',
    '14 Feet',
    '17 Feet',
    '19 Feet',
    '22 Feet',
    '32 Feet'
  ];
  final List<String> floorTypeList = [
    'Ground Floor',
    '1st Floor',
    '2nd Floor',
    '3rd Floor',
    '4th Floor',
    '5th Floor',
    '6th Floor',
    '7th Floor',
    '8th Floor',
    '9th Floor',
    '10th Floor',
    '11th Floor',
    '12th Floor',
    '13th Floor',
    '14th Floor',
    '15th Floor',
    '16th Floor',
    '17th Floor',
    '18th Floor',
    '19th Floor',
    '20th Floor',
  ];

  String? transportFromValue = "";
  String? transportToValue = "";
  String? vehicleType = "Part Load";
  String? nameValue = "";
  String? addressValue = "";
  String? mobileValue = "";
  String? emailValue = "N/A";
  String? companyNameValue = "N/A";
  String? gstNumberValue = "N/A";
  String? remarkValue = "N/A";
  num? packingChargesValue = 0;
  num? freightChargesValue = 0;
  num? loadingChargesValue = 0;
  String? floorType = "";
  num? unloadingChargesValue = 0;
  num? unpackingChargesValue = 0;
  num? escortChargesValue = 0;
  num? loadingUnloadingChargesValue = 0;
  num? freightOnValueValue = 0;
  num? statisticalChargesValue = 0;
  num? surchargeValue = 0;
  num? otherChargesValue = 0;
  num? mathadiValue = 0;
  num? storageChargesValue = 0;
  num? gstChargesValue = 0;

  num totalAmount = 0;

  @override
  void initState() {
    super.initState();
    transportFromController.text = transportFromValue.toString();
    transportToController.text = transportToValue.toString();
    nameController.text = nameValue.toString();
    addressController.text = addressValue.toString();
    mobileController.text = mobileValue.toString();
    emailController.text = emailValue.toString();
    companyNameController.text = companyNameValue.toString();
    gstNumberController.text = gstNumberValue.toString();
    remarkController.text = remarkValue.toString();
    packingChargesController.text = packingChargesValue.toString();
    freightChargesController.text = freightChargesValue.toString();
    loadingChargesController.text = loadingChargesValue.toString();
    unloadingChargesController.text = unloadingChargesValue.toString();
    unpackingChargesController.text = unpackingChargesValue.toString();
    escortChargesController.text = escortChargesValue.toString();
    loadingUnloadingChargesController.text =
        loadingUnloadingChargesValue.toString();
    freightOnValueController.text = freightOnValueValue.toString();
    statisticalChargesController.text = statisticalChargesValue.toString();
    surchargeController.text = surchargeValue.toString();
    otherChargesController.text = otherChargesValue.toString();
    mathadiController.text = mathadiValue.toString();
    storageChargesController.text = storageChargesValue.toString();
    gstChargesController.text = gstChargesValue.toString();
  }

  // @override
  // void dispose() {
  //   transportFromController.dispose();
  //   transportToController.dispose();
  // }

  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();

  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  final transportFromController = TextEditingController();
  final transportToController = TextEditingController();
  final movementDateController = TextEditingController();
  final movementTimeController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final companyNameController = TextEditingController();
  final gstNumberController = TextEditingController();
  final remarkController = TextEditingController();
  final packingChargesController = TextEditingController();
  final freightChargesController = TextEditingController();
  final loadingChargesController = TextEditingController();
  final unloadingChargesController = TextEditingController();
  final unpackingChargesController = TextEditingController();
  final escortChargesController = TextEditingController();
  final loadingUnloadingChargesController = TextEditingController();
  final freightOnValueController = TextEditingController();
  final statisticalChargesController = TextEditingController();
  final surchargeController = TextEditingController();
  final otherChargesController = TextEditingController();
  final mathadiController = TextEditingController();
  final storageChargesController = TextEditingController();
  final gstChargesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    String formattedDate = dateFormat.format(_dateTime);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Agarwal Packers"),
      ),
      body: SafeArea(
          bottom: true,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  key: _quotationKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        inputBox("Transport From", transportFromController,
                            TextInputType.text, validateInputBox),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Transport To", transportToController,
                            TextInputType.text, validateInputBox),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Movement Date",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Card(
                          child: MaterialButton(
                            onPressed: _showDatePicker,
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_today),
                                const SizedBox(width: 8),
                                Text(formattedDate)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Movement Time",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Card(
                          child: MaterialButton(
                            onPressed: _showTimePicker,
                            child: Row(
                              children: [
                                const Icon(Icons.watch_later_outlined),
                                const SizedBox(width: 8),
                                Text(_timeOfDay.format(context)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Vehcile Type",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Card(
                          child: Row(
                            children: [
                              const SizedBox(width: 16),
                              const Icon(Icons.arrow_drop_down_circle_outlined),
                              const SizedBox(width: 8),
                              DropdownButton(
                                value: vehicleType!.isNotEmpty
                                    ? vehicleType
                                    : vehicleTypeList[0],
                                items: vehicleTypeList
                                    .map((e) => DropdownMenuItem(
                                        value: e, child: Text(e)))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    vehicleType = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        inputBox("Name", nameController, TextInputType.name,
                            validateInputBox),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Address", addressController,
                            TextInputType.streetAddress, validateInputBox),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Mobile", mobileController,
                            TextInputType.phone, validateInputBox),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Email", emailController,
                            TextInputType.emailAddress, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Company Name", companyNameController,
                            TextInputType.name, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("GST No.", gstNumberController,
                            TextInputType.text, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Remark", remarkController, TextInputType.text,
                            null),
                        const SizedBox(
                          height: 10,
                        ),
                        const Card(
                          child: Center(
                            child: Text(
                              "For Transportation of Used Goods",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign
                                  .center, // Align text in the center horizontally
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Packing Charges", packingChargesController,
                            TextInputType.number, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Freight Charges", freightChargesController,
                            TextInputType.number, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Loading Charges", loadingChargesController,
                            TextInputType.number, null),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: Row(
                            children: [
                              const SizedBox(width: 16),
                              const Icon(Icons.arrow_drop_down_circle_outlined),
                              const SizedBox(width: 8),
                              DropdownButton(
                                value: floorType!.isNotEmpty
                                    ? floorType
                                    : floorTypeList[0],
                                items: floorTypeList
                                    .map((e) => DropdownMenuItem(
                                        value: e, child: Text(e)))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    floorType = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox(
                            "Unloading Charges",
                            unloadingChargesController,
                            TextInputType.number,
                            null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox(
                            "Unpacking Charges",
                            unpackingChargesController,
                            TextInputType.number,
                            null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Escort Charges", escortChargesController,
                            TextInputType.number, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox(
                            "Frieght Charges for Loading & Unloading",
                            loadingUnloadingChargesController,
                            TextInputType.number,
                            null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Freight on Value", freightOnValueController,
                            TextInputType.number, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox(
                            "Statistical Charges",
                            statisticalChargesController,
                            TextInputType.number,
                            null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Surcharge", surchargeController,
                            TextInputType.number, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Other Charges", otherChargesController,
                            TextInputType.number, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Mathadi paid by Client", mathadiController,
                            TextInputType.number, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Storage Charges", storageChargesController,
                            TextInputType.number, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("GST Charges", gstChargesController,
                            TextInputType.number, null),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () async {
                            if (_quotationKey.currentState!.validate()) {
                              setState(() {
                                transportFromValue =
                                    transportFromController.text;
                                transportToValue = transportToController.text;
                                nameValue = nameController.text;
                                addressValue = addressController.text;
                                mobileValue = mobileController.text;
                                emailValue = emailController.text;
                                companyNameValue = companyNameController.text;
                                gstNumberValue = gstNumberController.text;
                                remarkValue = remarkController.text;
                                packingChargesValue =
                                    num.parse(packingChargesController.text);
                                freightChargesValue =
                                    num.parse(freightChargesController.text);
                                loadingChargesValue =
                                    num.parse(loadingChargesController.text);
                                unloadingChargesValue =
                                    num.parse(unloadingChargesController.text);
                                unpackingChargesValue =
                                    num.parse(unpackingChargesController.text);
                                escortChargesValue =
                                    num.parse(escortChargesController.text);
                                loadingUnloadingChargesValue = num.parse(
                                    loadingUnloadingChargesController.text);
                                freightOnValueValue =
                                    num.parse(freightOnValueController.text);
                                statisticalChargesValue = num.parse(
                                    statisticalChargesController.text);
                                surchargeValue =
                                    num.parse(surchargeController.text);
                                otherChargesValue =
                                    num.parse(otherChargesController.text);
                                mathadiValue =
                                    num.parse(mathadiController.text);
                                storageChargesValue =
                                    num.parse(storageChargesController.text);
                                gstChargesValue =
                                    num.parse(gstChargesController.text);

                                totalAmount = packingChargesValue! +
                                    freightChargesValue! +
                                    loadingChargesValue! +
                                    unloadingChargesValue! +
                                    unpackingChargesValue! +
                                    escortChargesValue! +
                                    loadingUnloadingChargesValue! +
                                    freightOnValueValue! +
                                    statisticalChargesValue! +
                                    surchargeValue! +
                                    otherChargesValue! +
                                    mathadiValue! +
                                    storageChargesValue! +
                                    gstChargesValue!;
                              });

                              final data = await pdfService.generatePdf({
                                "Transport From": transportFromValue,
                                "Transport To": transportToValue,
                                "Movement Date":
                                    DateFormat('dd-MM-yyyy').format(_dateTime),
                                "Movement Time": _timeOfDay.format(context),
                                "Vehicle Type": vehicleType,
                                "Name": nameValue,
                                "Address": addressValue,
                                "Mobile": mobileValue,
                                "Email": emailValue,
                                "Company Name": companyNameValue,
                                "GST No.": gstNumberValue,
                                "Remark": remarkValue,
                                "Packing Charges": packingChargesValue,
                                "Freight Charges": freightChargesValue,
                                "Loading Charges": loadingChargesValue,
                                "Floor Type": floorType,
                                "Unloading Charges": unloadingChargesValue,
                                "Unpacking Charges": unpackingChargesValue,
                                "Escort Charges": escortChargesValue,
                                "Freight Charges for Loading & Unloading":
                                    loadingUnloadingChargesValue,
                                "Freight on Value": freightOnValueValue,
                                "Statistical Charges": statisticalChargesValue,
                                "Surcharge": surchargeValue,
                                "Other Charges": otherChargesValue,
                                "Mathadi paid by Client": mathadiValue,
                                "Storage Charges": storageChargesValue,
                                "GST Charges": gstChargesValue,
                                "Total Amount": totalAmount,
                              });
                              await pdfService.savePdf(
                                  "Quotation_${nameController.text}", data);
                              await uploadQuotationData();
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please fill all the required fields",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  fontSize: 16.0);
                            }
                          },
                          child: const Text(
                            "Generate Invoice",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )))),
    );
  }

  TextFormField inputBox(
      String label,
      TextEditingController controller,
      TextInputType textInputType,
      FormFieldValidator<String>? validateInputBox) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      validator: validateInputBox,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
