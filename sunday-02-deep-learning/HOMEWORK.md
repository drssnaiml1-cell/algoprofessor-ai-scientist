<img src="../assets/logo_transparent.png" width="140" align="right" alt="Algo Professor"/>

# Week 2 homework — Field-Ready Plant Disease Classifier

**After Sunday 2, Monday to Saturday · about 2–3 hours a day**

> Lab photos are clean; farmers' photos are not. You will build a classifier that is honest about the gap between the two and closes as much of it as possible.

**Data:** PlantVillage (full, 38 classes) for training; PlantDoc (real field photos) for testing  
**Submit:** commit every day; tag `week-2` and create a GitHub Release by **Saturday 23:59 local time**. Mentors review it before the next Sunday.

| Day | Assignment | Time |
|---|---|---|
| Monday | A 38-class image pipeline | 3 h |
| Tuesday | Transfer learning versus training from scratch | 3 h |
| Wednesday | Modern backbones and mixed precision | 3 h |
| Thursday | Robustness on real field photos | 3 h |
| Friday | Calibration, quantisation and edge deployment | 2–3 h |
| Saturday | Demo app and model card | 3 h |

## Monday — A 38-class image pipeline
*3 h* · **Goal:** Build a leakage-free data pipeline at full scale.

1. Download PlantVillage (all 38 classes) and PlantDoc.
2. De-duplicate by perceptual hash (not only exact MD5); report how many near-duplicates you found.
3. Create stratified splits and a `torch.utils.data.Dataset` with augmentation (flip, rotate, colour jitter, random resized crop).
4. Map PlantDoc labels onto PlantVillage classes; document classes with no match.

- **Deliverable:** `src/data.py`, `reports/data_card.md`
- **Done when:** No hash shared across splits; class counts per split tabulated; augmentation visualised on 8 images.
- **Stretch:** Use `torchvision.transforms.v2` and benchmark loading speed with 0, 2 and 4 workers.

## Tuesday — Transfer learning versus training from scratch
*3 h* · **Goal:** See what pretraining buys.

1. On a GPU (Colab or Kaggle), train ResNet-18 from scratch for 10 epochs.
2. Fine-tune an ImageNet-pretrained ResNet-18 for 10 epochs (freeze, then unfreeze).
3. Plot learning curves; report accuracy and macro-F1 on the PlantVillage test split.
4. Explain the difference in two paragraphs.

- **Deliverable:** `notebooks/02_transfer.ipynb` with curves and a comparison table
- **Done when:** Same data, epochs and seed for both runs; macro-F1 reported.
- **Stretch:** Add a learning-rate range test and one-cycle schedule.

## Wednesday — Modern backbones and mixed precision
*3 h* · **Goal:** Compare architectures fairly.

1. Fine-tune EfficientNet-B0 and a small ViT with `timm`, using mixed precision.
2. Record parameters, training time per epoch, GPU memory and test macro-F1 for each.
3. Build a confusion matrix for the best model; list the 3 most confused class pairs.

- **Deliverable:** Comparison table and confusion matrix in `reports/backbones.md`
- **Done when:** All three models compared on identical splits; costs (time, memory) reported next to accuracy.
- **Stretch:** Try ConvNeXt-Tiny or a distilled ViT (DeiT).

## Thursday — Robustness on real field photos
*3 h* · **Goal:** Measure and close the lab-to-field gap.

1. Evaluate your best model on PlantDoc field photos; report the accuracy drop.
2. Retrain with stronger augmentation (blur, noise, brightness, background cut-and-paste) and re-test.
3. Build a Grad-CAM gallery of 12 field failures and group them by cause.

- **Deliverable:** `reports/robustness.md` with before/after tables and the Grad-CAM gallery
- **Done when:** Lab vs field accuracy reported for both training recipes; failure causes categorised.
- **Stretch:** Fine-tune on 10% of PlantDoc and measure how much labelled field data helps.

## Friday — Calibration, quantisation and edge deployment
*2–3 h* · **Goal:** Make it small, fast and honest about uncertainty.

1. Measure calibration (expected calibration error) and apply temperature scaling.
2. Add a 'not sure' answer below a confidence threshold; report coverage vs accuracy.
3. Export to ONNX, quantise to INT8, and benchmark CPU latency (median and p95 over 200 images).

- **Deliverable:** `models/leafdoctor_int8.onnx`, `reports/deploy.md`
- **Done when:** ECE before and after scaling; latency table; INT8 accuracy within 1 point of FP32 or explained.
- **Stretch:** Run the ONNX model in a browser with ONNX Runtime Web.

## Saturday — Demo app and model card
*3 h* · **Goal:** Ship it.

1. Build a Gradio or Streamlit app: upload a leaf photo, get the top-3 diseases with confidence and Grad-CAM.
2. Write `MODEL_CARD.md` covering lab vs field performance and the 'not sure' policy.
3. Record a 5-minute demo; push, tag `week-2`, create a Release.

- **Deliverable:** App, model card, demo link, Release `week-2`
- **Done when:** App works on a phone photo; model card states field accuracy, not only lab accuracy.
- **Stretch:** Deploy on Hugging Face Spaces.
