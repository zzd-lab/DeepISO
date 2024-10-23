# DeepISO
![模型架构图3个](https://github.com/user-attachments/assets/7875dffc-4ced-4af2-b3f6-3e4fa607c760)

DeepISO utilizes both sequence and structural information to predict interactions between protein isoforms. To capture the structural information of interacting isoforms, we represent each protein's structure as a residue contact map. We then employ two graph convolutional neural networks (GCNs) to extract isoform features and ultimately train two GCN models to predict isoform interactions. Specifically, we use pre-trained protein language models, ESM2, to generate high-dimensional embedding vectors for every residue of an interacting protein isoform in the first GCN model (i.e., the ESM-based GCN model). In contrast, we rely heavily on structural features to encode each residue in the second GCN model (i.e., the SF-based GCN model). For sequence-based prediction, we also use the pre-trained ESM2 model to generate embedding vectors for each protein sequence, which are then input into a random forest model for prediction. By integrating both structural and sequence information of isoforms, we extract features at the residue level, allowing us to predict interactions between isoforms with similar sequence information with maximum accuracy.

# Graph convolutional neural network
 In DeepISO, we use GCN and random forest to capture hidden features of protein structures. Before usage, the user should first calculate the residue features of the proteins using ESM2 and PesTO. The graph used here is a residue contact map, with a threshold of 8 Å.

# USAGE
## DATASET
We provide the dataset used in this study from Yang et al., which can be found in the dataset folder. The dataset used by DeepISO contains both positive and negative samples. Each file includes three columns: the first column is the Isoform, the second column is the interaction partner, and the third column is the label.
## Requirements
torch (==2.0.1)<br/>
scikit-learn (==1.2.2)<br/>
scipy (==1.10.1)<br/>
numpy (==1.24.3)<br/>
zzd (==1.0.5)<br/>

# Feature preparing
## ESM2 GCN feature preparing
Users should first generate a .pdb file for each protein (which can be obtained through Uniprot or predicted using AlphaFold/ESMFold). Then, users should use the ESM2 model (esm2_t33_650M_UR50D) to generate a .pt file for each protein.Finally, based on the /PeSTO/DeepISO.ESM2.PeSTO.feature.input.ipynb notebook, predict the probability of each residue in each protein being involved in protein-protein interactions.
## SF(Structure Feature) GCN feature preparing




