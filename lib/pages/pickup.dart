// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class PickUp extends StatelessWidget {
//   const PickUp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       child: Column(
//         children: [
//           ListTile(
//             title: Text(
//               provider.marchantList[index].userName! ??
//                   'N/A',
//               style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1,
//                   fontSize: 14,
//                   color: Colors.black),
//             ),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Phone: ${provider.marchantList[index].userPhone!}',
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w500),
//                 ),
//                 Text(
//                   'Address: ${provider.marchantList[index].address!}',
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w500),
//                 ),
//                 Text(
//                   'Item Count : ${itemList!.length.toString()}',
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//           ),
//           ListView.builder(
//             itemCount: itemList.length,
//             itemBuilder: (BuildContext context, int serial) {
//               return Consumer<MarchantProvider>(
//                   builder: (context, marchantProvider, _) {
//                     return Column(
//                       crossAxisAlignment:
//                       CrossAxisAlignment.end,
//                       children: [
//                         serial == 1
//                             ? Container(
//                           height: 50,
//                           child: Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.end,
//                             children: [
//                               Text('Select All'),
//                               Checkbox(
//                                 onChanged: (value) {
//                                   setState(() {
//                                     allSelected =
//                                     !allSelected;
//                                     // marchantProvider.merchantBools[0][0]=true;
//                                   });
//                                 },
//                                 value: allSelected,
//                               ),
//                             ],
//                           ),
//                         )
//                             : Container(),
//                         Padding(
//                           padding:
//                           const EdgeInsets.only(left: 15.0),
//                           child: ListTile(
//                             style: ListTileStyle.list,
//                             contentPadding:
//                             const EdgeInsets.symmetric(
//                                 horizontal: 16),
//                             // leading: Checkbox(onChanged: (bool? value) {  }, value: false,),
//                             // trailing: Container(
//                             //   height: 20,
//                             //   width: 20,
//                             //   child: Checkbox(
//                             //     onChanged: (value) {
//                             //       setState(() {
//                             //         // checkboxStates[index] = value ?? false;
//                             //         singleChk = singleChk
//                             //             ? false
//                             //             : true;
//                             //         // print(checkboxValues[0]);
//                             //         marchantProvider
//                             //                     .merchantBools[
//                             //                 0][0] =
//                             //             !marchantProvider
//                             //                     .merchantBools[
//                             //                 0][0];
//                             //       });
//                             //     },
//                             //     value: allSelected == true
//                             //         ? allSelected
//                             //         : marchantProvider
//                             //             .merchantBools[0][0],
//                             //   ),
//                             // ),
//                             title: SizedBox(
//                               child: Row(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "${serial}.  ",
//                                     style: const TextStyle(
//                                         fontWeight:
//                                         FontWeight.bold),
//                                   ),
//                                   Expanded(
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             color: logogold
//                                                 .withOpacity(0.4),
//                                             border: Border.all(),
//                                             borderRadius:
//                                             BorderRadius
//                                                 .circular(12)),
//                                         child: Padding(
//                                           padding:
//                                           const EdgeInsets.all(
//                                               2.0),
//                                           child: Column(
//                                             children: [
//                                               Column(
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Container(
//                                                     child: Row(
//                                                       children: [
//                                                         const Icon(
//                                                           Icons
//                                                               .emoji_people,
//                                                           color:
//                                                           logoblue,
//                                                         ),
//                                                         const Text(
//                                                           "Customer Name: ",
//                                                           style: TextStyle(
//                                                               color:
//                                                               logoblue,
//                                                               fontWeight:
//                                                               FontWeight.w500),
//                                                         ),
//                                                         Text(
//                                                             "${item.recipientName21}",
//                                                             style: const TextStyle(
//                                                                 color:
//                                                                 logoblue,
//                                                                 fontWeight:
//                                                                 FontWeight.w500))
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Container(
//                                                     child: Row(
//                                                       children: [
//                                                         const Icon(
//                                                             Icons
//                                                                 .phone,
//                                                             color:
//                                                             logoblue),
//                                                         const Text(
//                                                             "Customer Phone: ",
//                                                             style: TextStyle(
//                                                                 color:
//                                                                 logoblue,
//                                                                 fontWeight:
//                                                                 FontWeight.w500)),
//                                                         Text(
//                                                             "${item.recipientPhone20}",
//                                                             style: const TextStyle(
//                                                                 color:
//                                                                 logoblue,
//                                                                 fontWeight:
//                                                                 FontWeight.w500))
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Row(
//                                                     children: [
//                                                       const Icon(
//                                                           Icons
//                                                               .numbers,
//                                                           color:
//                                                           logoblue),
//                                                       const Text(
//                                                           "Invoice: ",
//                                                           style: TextStyle(
//                                                               color:
//                                                               logoblue,
//                                                               fontWeight:
//                                                               FontWeight.w500)),
//                                                       Text(
//                                                           "${item.id}",
//                                                           style: const TextStyle(
//                                                               color:
//                                                               logoblue,
//                                                               fontWeight:
//                                                               FontWeight.w500))
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       )),
//                                 ],
//                               ),
//                             ),
//                             dense: true,
//                             onTap: () {
//                               Navigator.pushNamed(context,
//                                   ItemDetailsPage.routeName);
//                             },
//                           ),
//                         ),
//                         serial == itemList!.length
//                             ? Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.center,
//                           children: [
//                             ElevatedButton(
//                                 onPressed: () {
//                                   for (int i = 0;
//                                   i <
//                                       marchantProvider
//                                           .merchantBools[
//                                       index]
//                                           .length;
//                                   i++) {
//                                     if (marchantProvider
//                                         .merchantBools[
//                                     index][i]) {
//                                       provider
//                                           .saveDelivery(
//                                         pickupId: provider
//                                             .merchantDataList[
//                                         index]
//                                             .assignBranchPickupList![
//                                         i]
//                                             .id
//                                             .toString(),
//                                         statusId: '4',
//                                         context: context,
//                                       );
//                                     }
//                                   }
//                                 },
//                                 child: Text(
//                                     'Collect Pickup')),
//                           ],
//                         )
//                             : Container()
//                       ],
//                     );
//                   });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
