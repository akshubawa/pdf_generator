import 'package:agarwal_packers/app/database.dart';
import 'package:agarwal_packers/services/quotation_pdf_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

final _quotationKey = GlobalKey<FormState>();

class QuotationView extends StatefulWidget {
  const QuotationView({super.key});

  @override
  State<QuotationView> createState() => _QuotationViewState();
}

class _QuotationViewState extends State<QuotationView> {
  final PdfService pdfService = PdfService();

  String? validateInputBox(String? value) {
    if (value!.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  uploadQuotationData() async {
    Map<String, dynamic> dataToUpload = {
      "Quotation Id": quotationId,
      "Movement Date": DateFormat('dd-MM-yyyy').format(_dateTime),
      "Vehicle Type": vehicleType,
      "Name": nameController.text,
      "Company Name": companyNameController.text,
      "GST No.": gstNumberController.text,
      "Address": addressController.text,
      "Email": emailController.text,
      "Mobile": mobileController.text,
      "Transport From": transportFromController.text,
      "Transport To": transportToController.text,
      "Freight Charges": freightChargesController.text,
      "Car Transportation Charges": transportationChargesController.text,
      "Loading Charges": loadingChargesController.text,
      "Unloading Charges": unloadingChargesController.text,
      "Packing Charges": packingChargesController.text,
      "Unpacking Charges": unpackingChargesController.text,
      "Installation Charges": installationChargesController.text,
      "Stationary Charges": stationaryChargesController.text,
      "Toll Charges": tollChargesController.text,
      "GST Charges": gstChargesController.text,
      "Insurance Charges": insuranceChargesController.text,
      "Total Amount": totalAmount,
    };

    DatabaseMethods().addQuotation(dataToUpload);
  }

  final List<String> vehicleTypeList = [
    'Part Load',
    '14 Feet',
    '17 Feet',
    '19 Feet',
    '22 Feet',
    '32 Feet'
  ];

  String? quotationId = "QTZ12345";
  String? vehicleType = "Part Load";
  String? nameValue = "Akshay";
  String? companyNameValue = "N/A";
  String? gstNumberValue = "N/A";
  String? addressValue = "Balawala, Dehradun";
  String? emailValue = "akshunegi0@gmail.com";
  String? mobileValue = "7088839967";
  String? transportFromValue = "Dehradun";
  String? transportToValue = "Delhi";
  num? freightChargesValue = 0;
  num? transportationChargesValue = 0;
  num? loadingChargesValue = 0;
  num? unloadingChargesValue = 0;
  num? packingChargesValue = 0;
  num? unpackingChargesValue = 0;
  num? installationsChargesValue = 0;
  num? stationaryChargesValue = 0;
  num? tollChargesValue = 0;
  num? gstChargesValue = 0;
  num? insuranceChargesValue = 0;

  num? totalAmount = 0;

  @override
  void initState() {
    super.initState();
    nameController.text = nameValue.toString();
    companyNameController.text = companyNameValue.toString();
    gstNumberController.text = gstNumberValue.toString();
    addressController.text = addressValue.toString();
    emailController.text = emailValue.toString();
    mobileController.text = mobileValue.toString();
    transportFromController.text = transportFromValue.toString();
    transportToController.text = transportToValue.toString();
    freightChargesController.text = freightChargesValue.toString();
    transportationChargesController.text =
        transportationChargesValue.toString();
    loadingChargesController.text = loadingChargesValue.toString();
    unloadingChargesController.text = unloadingChargesValue.toString();
    packingChargesController.text = packingChargesValue.toString();
    unpackingChargesController.text = unpackingChargesValue.toString();
    installationChargesController.text = installationsChargesValue.toString();
    stationaryChargesController.text = stationaryChargesValue.toString();
    tollChargesController.text = tollChargesValue.toString();
    gstChargesController.text = gstChargesValue.toString();
    insuranceChargesController.text = installationsChargesValue.toString();
  }

  // @override
  // void dispose() {
  //   transportFromController.dispose();
  //   transportToController.dispose();
  // }

  DateTime _dateTime = DateTime.now();

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

  final nameController = TextEditingController();
  final companyNameController = TextEditingController();
  final gstNumberController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final transportFromController = TextEditingController();
  final transportToController = TextEditingController();
  final freightChargesController = TextEditingController();
  final transportationChargesController = TextEditingController();
  final loadingChargesController = TextEditingController();
  final unloadingChargesController = TextEditingController();
  final packingChargesController = TextEditingController();
  final unpackingChargesController = TextEditingController();
  final installationChargesController = TextEditingController();
  final stationaryChargesController = TextEditingController();
  final tollChargesController = TextEditingController();
  final gstChargesController = TextEditingController();
  final insuranceChargesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    String formattedDate = dateFormat.format(_dateTime);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quotation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                        inputBox("Company Name", companyNameController,
                            TextInputType.name, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Client GST No.", gstNumberController,
                            TextInputType.text, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Address", addressController,
                            TextInputType.streetAddress, validateInputBox),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Email", emailController,
                            TextInputType.emailAddress, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Mobile", mobileController,
                            TextInputType.phone, validateInputBox),
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
                        inputBox("Freight Charges", freightChargesController,
                            TextInputType.number, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox(
                            "Car Transportation Charges",
                            transportationChargesController,
                            TextInputType.number,
                            null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Loading Charges", loadingChargesController,
                            TextInputType.number, null),
                        const SizedBox(
                          height: 10,
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
                        inputBox("Packing Charges", packingChargesController,
                            TextInputType.number, null),
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
                        inputBox(
                            "Installation Charges",
                            installationChargesController,
                            TextInputType.number,
                            null),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox(
                            "Stationary Charges",
                            stationaryChargesController,
                            TextInputType.number,
                            null),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("Toll & Highway Charges",
                            tollChargesController, TextInputType.number, null),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox("GST Charges", gstChargesController,
                            TextInputType.number, null),
                        const SizedBox(
                          height: 10,
                        ),
                        inputBox(
                            "Insurance Charges",
                            insuranceChargesController,
                            TextInputType.number,
                            null),
                        const SizedBox(
                          height: 10,
                        ),
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
                                nameValue = nameController.text;
                                companyNameValue = companyNameController.text;
                                gstNumberValue = gstNumberController.text;
                                addressValue = addressController.text;
                                emailValue = emailController.text;
                                mobileValue = mobileController.text;
                                transportFromValue =
                                    transportFromController.text;
                                transportToValue = transportToController.text;
                                freightChargesValue =
                                    num.tryParse(freightChargesController.text);
                                transportationChargesValue = num.tryParse(
                                    transportationChargesController.text);
                                loadingChargesValue =
                                    num.tryParse(loadingChargesController.text);
                                unloadingChargesValue = num.tryParse(
                                    unloadingChargesController.text);
                                packingChargesValue =
                                    num.tryParse(packingChargesController.text);
                                unpackingChargesValue = num.tryParse(
                                    unpackingChargesController.text);
                                installationsChargesValue = num.tryParse(
                                    installationChargesController.text);
                                stationaryChargesValue = num.tryParse(
                                    stationaryChargesController.text);
                                tollChargesValue =
                                    num.tryParse(tollChargesController.text);
                                gstChargesValue =
                                    num.tryParse(gstChargesController.text);
                                insuranceChargesValue = num.tryParse(
                                    insuranceChargesController.text);
                                totalAmount = freightChargesValue! +
                                    transportationChargesValue! +
                                    loadingChargesValue! +
                                    unloadingChargesValue! +
                                    packingChargesValue! +
                                    unpackingChargesValue! +
                                    installationsChargesValue! +
                                    stationaryChargesValue! +
                                    tollChargesValue! +
                                    gstChargesValue! +
                                    insuranceChargesValue!;
                              });

                              final data = await pdfService.generatePdf({
                                "Quotation Id": quotationId,
                                "Movement Date":
                                    DateFormat('dd-MM-yyyy').format(_dateTime),
                                "Vehicle Type": vehicleType,
                                "Name": nameController.text,
                                "Company Name": companyNameController.text,
                                "GST No.": gstNumberController.text,
                                "Address": addressController.text,
                                "Email": emailController.text,
                                "Mobile": mobileController.text,
                                "Transport From": transportFromController.text,
                                "Transport To": transportToController.text,
                                "Freight Charges":
                                    freightChargesController.text,
                                "Car Transportation Charges":
                                    transportationChargesController.text,
                                "Loading Charges":
                                    loadingChargesController.text,
                                "Unloading Charges":
                                    unloadingChargesController.text,
                                "Packing Charges":
                                    packingChargesController.text,
                                "Unpacking Charges":
                                    unpackingChargesController.text,
                                "Installation Charges":
                                    installationChargesController.text,
                                "Stationary Charges":
                                    stationaryChargesController.text,
                                "Toll Charges": tollChargesController.text,
                                "GST Charges": gstChargesController.text,
                                "Insurance Charges":
                                    insuranceChargesController.text,
                                "Total Amount": totalAmount,
                              });
                              await pdfService.savePdf(
                                  "Quotation_$quotationId", data);
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
