G1G3Correlation="0.80"
G2G3Correlation="0.90"
mkdir -p reports
cat <<EOM > reports/leakage_decision.md
# Leakage-Decision Note
## Session Information
- Correlation between G1 and G3: **$G1G3Correlation**
- Correlation between G2 and G3: **$G2G3Correlation**
EOM
echo "✅ File created successfully in reports/leakage_decision.md"
