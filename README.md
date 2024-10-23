# DeepISO
![模型架构图3个](https://github.com/user-attachments/assets/7875dffc-4ced-4af2-b3f6-3e4fa607c760)

DeepISO utilizes both sequence and structural information to predict interactions between protein isoforms. To capture the structural information of interacting isoforms, we represent each protein's structure as a residue contact map. We then employ two graph convolutional neural networks (GCNs) to extract isoform features and ultimately train two GCN models to predict isoform interactions. Specifically, we use pre-trained protein language models, ESM2, to generate high-dimensional embedding vectors for every residue of an interacting protein isoform in the first GCN model (i.e., the ESM-based GCN model). In contrast, we rely heavily on structural features to encode each residue in the second GCN model (i.e., the SF-based GCN model). For sequence-based prediction, we also use the pre-trained ESM2 model to generate embedding vectors for each protein sequence, which are then input into a random forest model for prediction. By integrating both structural and sequence information of isoforms, we extract features at the residue level, allowing us to predict interactions between isoforms with similar sequence information with maximum accuracy.

# Graph convolutional neural network
 In DeepISO, we use GCN and random forest to capture hidden features of protein structures. Before usage, the user should first calculate the residue features of the proteins using ESM2 and PesTO. The graph used here is a residue contact map, with a threshold of 8 Å.

 

